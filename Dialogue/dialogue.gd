extends Control

#when the scene starts, a bunch of scenes will be linked to variables, so they become easier to recall later on
@onready var dialogue = $Dialogue
@onready var NameTag = $NameTag
@onready var A_button = $"../A_button"
@onready var B_button = $"../B_button"
@onready var C_button = $"../C_button"
@onready var D_button = $"../D_button"
@onready var NextDialButton = $"../NextDialButton"
@onready var DefaultAudio = $DefaultAudio
@onready var DomoAudio = $DomoAudio
@onready var BlooberAudio = $BlooberAudio
@onready var GooberAudio = $GooberAudio
@onready var MapButton = $"../MapButton"
var visible_text_tween;
var text := 0
var Conversation = ""

func _ready() -> void:
	#connects to functions to their respective signals, so that other files may call on them
	Global.display_label_text.connect(display_label_text)
	Global.setup_convo.connect(setup_convo)
	Global.resetdialogue.connect(resetdialogue)
	Global.enddialogue.connect(enddialogue)
	Global.skipdialogue.connect(skipdialogue)
	Global.testfunc.connect(testfunc)
	#the intro will only be played if it has not been played prior
	if Global.introplayed == false:
		setup_convo("intro")
		Global.introplayed = true
	
func setup_convo(convo):
	#in order for the conversation to set up, the previous one is first discontinued
	enddialogue()
	MapButton.visible = false
	$"../MapButton".visible = false
	$"../IslandMap".visible = false
	#gets the JSON file
	var file = FileAccess.open("res://JSON/Dialogue.json", FileAccess.READ)
	text = 0
	$".".visible = true
	$"../NextDialButton".visible = true
	Global.gatekeeping = false
	Global.dialogue_running = true
	#makes all the dialogue buttons invisible
	for p in range(0, 4):
		get_node("../%s" % Global.allchartypes_array[p] + "_button").visible = false
	NextDialButton.visible = true
	if file:
	# Read the file's content
		var json_data = file.get_as_text()
		file.close()

	# Parse the JSON data
		var json = JSON.new()
		var parse_result = json.parse(json_data)
		Global.convlengthfound = false

		if parse_result == OK:
			var data = json.get_data()  # Use `get_data()` to access the parsed JSON object
		
			if data.has("Conversations"):  # Safely check if "Conversations" exists
				var conversations = data["Conversations"]

				if conversations.has(convo):  # Safely check if the conversation called for exists
					Conversation = conversations[convo]
				# Extract the strings from Str1 to convlength
					for i in range(1, Conversation.size()):
						if Global.convlengthfound == false :
							var string = "str" + str(i)
							if Conversation.has(string):
								i += 1
							else:
								Global.convlengthfound = true
								Global.convlength = i
					for i in range(1, Global.convlength):  # From 1 to convlength
						var string = "str" + str(i)
						#for each variable, it checks if it's present in the JSON file.
						#if it is present, said var gets pushed into the respective array. Else, NULL gets pushed in
						#pushed var string
						#it only checks for the other variables if Strx is found
						if Conversation.has(string):  # Safely check if the key exists
							var stringvalue = Conversation[string]
							Global.text_array.push_back(stringvalue)
							if Conversation.has("strq"):
								Global.textqValue = Conversation["strq"]
								#sets buttonXvalue
								for p in range (0,4):
									if Conversation.has("option" + Global.allchartypes_array[p]):
										Global.set("button" + Global.allchartypes_array[p] + "value", Conversation[("button" + Global.allchartypes_array[p])])
										Global.set("option" + Global.allchartypes_array[p] + "value", Conversation[("option" + Global.allchartypes_array[p])])
									else:
										Global.set("button" + Global.allchartypes_array[p] + "value", "NONE")
										Global.set("option" + Global.allchartypes_array[p] + "value", "NONE")
							#repeats this loop for every variable in the "allvars" array
							for p in range(0, Global.allvars_array.size()):
								#checks if this variable is present in the JSON file at position i
								if Conversation.has(Global.allvars_array[p] + "q"):
									Global.set(Global.allvars_array[p] + "qvalue", Conversation[(Global.allvars_array[p] + "q")])
								else:
									Global.set(Global.allvars_array[p] + "qvalue", "NONE")
								if Conversation.has(Global.allvars_array[p] + str(i)):
									#if it is present, it will push back the value found at location i for variable var[p]
									Global.get(Global.allvars_array[p] + "_array").push_back(Conversation[(Global.allvars_array[p] + str(i))])
								else:	
									#if it's not present, it will push "NONE" into the array instead
									Global.get(Global.allvars_array[p] + "_array").push_back("NONE")
							# read through the JSON file, and finds everything with valuex for example
						else:
							print("dude you're missing the var string")
					display_label_text()
				else:
					print("'" + str(convo) + "' key not found in 'Conversations'")
			else:
				print("'Conversations' key not found in JSON")
		else:
			print("JSON parsing error: ", json.get_error_message())
	else:
		print("File not found: res://JSON/Dialogue.json")
	pass
#This function will read through the dialogue arrays one by one, with each click of the button
func display_label_text():
	Global.gatekeeping = true
	if text < Global.text_array.size():
		#if a background is given, set the background to that variable
		if Global.background_array[text] != "NONE":
			Global.loadbackground.emit(Global.background_array[text])
		#checks if there's a character at this spot in the conversation
		for p in range(0, 4):
			#checks if previous character matches ANY of the current characters; if they don't match, then removes previous character
			#it also just doesn't activate if it's on line 0, because there is no value -1
			if text != 0 and (Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1]) != "NONE":
				if Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1] != Global.charA_array[text] and Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1] != Global.charB_array[text] and Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1] != Global.charC_array[text] and Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1] != Global.charD_array[text]:
				#if there is no current character on this position, the previous character should disappear
				#AND the previous character doesn't match ANY of the current characters
					get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1]).visible = false
			#if the character exists (doesn't not exist)
			if Global.get("char" + Global.allchartypes_array[p] + "_array")[text] != "NONE": 
			#sets the position
				#if the position doesn't exists 
				if Global.get("pos" + Global.allchartypes_array[p] + "_array")[text] == "NONE":
					#set position to the default position
					get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).set_position(Global.alldefaultpos_array[p])
				else:
					#fetch position from the JSON file
					var posstring = Global.get("pos" + Global.allchartypes_array[p] + "_array")[text]
					#split position into x and y variables
					var posstringsplit = posstring.split(",")
					var posx = int(posstringsplit[0])
					var posy = int(posstringsplit[1])
					#use those variables to set the position
					get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).set_position(Vector2(posx, posy))
			#sets the orientation
				#if the orientation doesn't exist
				if Global.get("ori" + Global.allchartypes_array[p] + "_array")[text] == "NONE":
					#set to default orientation
					get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).set_scale(Global.alldefaultscale_array[p])
				else:
					#if the character should not be in the default position, make it face right, or left
					if Global.get("ori" + Global.allchartypes_array[p] + "_array")[text] == "right":
						get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).set_scale(Vector2(10, 10))
					else:
						if Global.get("ori" + Global.allchartypes_array[p] + "_array")[text] == "left":
							get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).set_scale(Vector2(-10, 10))
						else:
						#fetch scale from the JSON file
							var oristring = Global.get("ori" + Global.allchartypes_array[p] + "_array")[text]
						#split scale into x and y variables
							var oristringsplit = oristring.split(",")
							var orix = int(oristringsplit[0])
							var oriy = int(oristringsplit[1])
							#use those variables to set the ori
							get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).set_scale(Vector2(orix, oriy))
			#makes character visible
				get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).visible = true
			#makes character play correct animation
				get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).play(Global.get("anim" + Global.allchartypes_array[p] + "_array")[text])
		if Global.func_array[text] != "NONE":
			Global.localfunc_array = Global.func_array[text].rsplit(",", false, 0)
			call(Global.localfunc_array[0])
		#makes sure that the current voice is empty
		var voiceplaying = ""
		#if there is a voice given in the JSON, it will take that voice
		if Global.voice_array[text] != "NONE":
			voiceplaying = Global.voice_array[text]
		else:
			#if no voice is in the JSON, it will check if the Yapper his their exclusive voice
			if Global.voicedchars_array.has(Global.yapper_array[text]):
				voiceplaying = Global.yapper_array[text] + "Audio"
			else:
				#if the yapper doesn't, it will play default voice
				voiceplaying = "DefaultAudio"
		dialogue.set_visible_characters(0)
		NameTag.text = Global.yapper_array[text] + ":"
		dialogue.text = Global.text_array[text]
		Global.displayrange = Global.text_array[text].length() + 1
		var stringchars = Global.text_array[text].split("")
		for displaying in range (0, Global.displayrange):
			if displaying <= Global.displayrange:
				#for every symbol (character) that appears, it will play the voice sound and then wait 0.05 seconds, unless the character is a comma, exclamation mark, question mark, or period, in which case it'll wait 0.08 seconds, and not play the sound
				dialogue.set_visible_characters(displaying)
				if stringchars[displaying-1] != "," and stringchars[displaying-1] != "!" and stringchars[displaying-1] != "." and stringchars[displaying-1] != "?":
					get_node(voiceplaying).play()
					await get_tree().create_timer(0.05).timeout
				else:
					await get_tree().create_timer(0.1).timeout
		pass
	
		text += 1
		
		Global.gatekeeping = false
	else:
		if Conversation.has("strq"):
			for p in range(0, 4):
				Global.buttonsappear.emit()
			NextDialButton.visible = false
		#makes all the dialogue buttons visible
			for p in range(0, 4):
					#checks if previous character matches ANY of the current characters; if they don't match, then removes previous character
					#it also just doesn't activate if it's on line 0, because there is no value -1
				if text != 0:
			#most instances of [text] have been removed, as the question falls outside of the [text] range. [text-1] remains, because that does fall within the range
					if Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1] != Global.charAqvalue and Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1] != Global.charBqvalue and Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1] != Global.charCqvalue and Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1] != Global.charDqvalue:
					#if there is no current character on this position, the previous character should disappear
					#AND the previous character doesn't match ANY of the current characters
						get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1]).visible = false
				#if the character exists (doesn't not exist)
				if Global.get("char" + Global.allchartypes_array[p] + "qvalue") != "NONE": 
					get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "qvalue")).visible = true
					get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "qvalue")).play(Global.get("anim" + Global.allchartypes_array[p] + "qvalue"))
				#sets the position
					#if the position doesn't exists 
					if Global.get("pos" + Global.allchartypes_array[p] + "qvalue") == "NONE":
						#set position to the default position
						get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "qvalue")).set_position(Global.alldefaultpos_array[p])
					else:
						#fetch position from the JSON file
						var posstring = Global.get("pos" + Global.allchartypes_array[p] + "qvalue")
						#split position into x and y variables
						var posstringsplit = posstring.split(",")
						var posx = int(posstringsplit[0])
						var posy = int(posstringsplit[1])
						#use those variables to set the position
						get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "qvalue")).set_position(Vector2(posx, posy))
					#if the orientation doesn't exist
					if Global.get("ori" + Global.allchartypes_array[p] + "qvalue") == "NONE":
						#set to default orientation
						get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "qvalue")).set_scale(Global.alldefaultscale_array[p])
					else:
						#if the character should not be in the default position, make it face right, or left
						if Global.get("ori" + Global.allchartypes_array[p] + "qvalue") == "right":
							get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "qvalue")).set_scale(Vector2(10, 10))
						else:
							if Global.get("ori" + Global.allchartypes_array[p] + "qvalue")[text] == "left":
								get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "qvalue")[text]).set_scale(Vector2(-10, 10))
							else:
						#fetch scale from the JSON file
								var oristring = Global.get("ori" + Global.allchartypes_array[p] + "qvalue")[text]
							#split scale into x and y variables
								var oristringsplit = oristring.split(",")
								var orix = int(oristringsplit[0])
								var oriy = int(oristringsplit[1])
								#use those variables to set the ori
								get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "qvalue")[text]).set_scale(Vector2(orix, oriy))
			#follows the same principal as the other voice variable, except this does it for q instead of x
			var voiceplaying = ""
			if Global.voiceqvalue != "NONE":
				voiceplaying = Global.voiceqvalue
			else:
				if Global.voicedchars_array.has(Global.yapperqvalue):
					voiceplaying = Global.yapperqvalue + "Audio"
				else:
					voiceplaying = "DefaultAudio"
			dialogue.visible_ratio = 0
			NameTag.text = Global.yapperqvalue + ":"
			dialogue.text = Global.textqValue
			Global.displayrange = Global.textqValue.length() + 1
			for displaying in range (0, Global.displayrange):
				if displaying <= Global.displayrange:
					dialogue.set_visible_characters(displaying)
					get_node(voiceplaying).play()
					await get_tree().create_timer(0.05).timeout
			Global.dialogue_running = false
		else: 
			resetdialogue()
#this function lets the player skip to the end of a string
func skipdialogue():
	dialogue.set_visible_characters(Global.displayrange)
	Global.displayrange = 0
#this function will reset the dialogue, it will allow the conversation to continue after a question is answered
func resetdialogue():
#when strings in the conversation run out, makes all remaining characters disappear
	dialogue.set_visible_characters(0)
#resets all variables necessary for displaying the text
	NameTag.text = ""
	Global.text_array = []
	dialogue.text = ""
	Global.dialogue_running = false
	visible_text_tween;
	Conversation = ""

	$".".visible = false
	$"../NextDialButton".visible = false
	MapButton.visible = true
#this function will end the dialogue, it triggers if no question is asked at all
func enddialogue():
#when strings in the conversation run out, makes all remaining characters disappear
	if text > 0:
		for r in range(0, 4):
			if Global.get("char" + Global.allchartypes_array[r] + "_array")[text-1] != "NONE": 
				get_node("../%s" % Global.get("char" + Global.allchartypes_array[r] + "_array")[text-1]).visible = false
#resets all variables necessary for displaying the text
	text = 0
	for t in range (0, Global.allvars_array.size()):
		Global.set(Global.allvars_array[t] + "_array", [])
	resetdialogue()
	#print(Global.gatekeeping)
#this is the test function
func testfunc():
	print("Omg it works! Awesome!!")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
