extends Control

@onready var dialogue = $Dialogue
#@onready var Goober = $"../Goober"

var visible_text_tween;
var text := 0

func _ready() -> void:
	Global.display_label_text.connect(display_label_text)
	Global.setup_convo.connect(setup_convo)
	
func setup_convo(convo):
	var file = FileAccess.open("res://JSON/Dialogue.json", FileAccess.READ)
	if file:
	# Read the file's content
		var json_data = file.get_as_text()
		file.close()

	# Parse the JSON data
		var json = JSON.new()
		var parse_result = json.parse(json_data)

		if parse_result == OK:
			var data = json.get_data()  # Use `get_data()` to access the parsed JSON object
		
			if data.has("Conversations"):  # Safely check if "Conversations" exists
				var conversations = data["Conversations"]

				if conversations.has(convo):  # Safely check if "AAAA" exists
					var Conversation = conversations[convo]
				# Extract the strings from Str1 to convlength
					for i in range(1, Conversation.size()):
						if Global.convlengthfound == false :
							var seeker = 1
							#seeker is the variable that increases when the string has not been found
							#when the string is found, convlength is set to seeker and seeker will no longer increase
							var string = "str" + str(i)
							if Conversation.has(string):
								print(i)
								i += 1
							else:
								Global.convlengthfound = true
								Global.convlength = i
								print(Global.convlength)

					for i in range(1, Global.convlength):  # From 1 to convlength
						var charA = "charA" + str(i)
						var charB = "charB" + str(i)
						var charC = "charC" + str(i)
						var charD = "charD" + str(i)
						var animA = "animA" + str(i)
						var animB = "animB" + str(i)
						var animC = "animC" + str(i)
						var animD = "animD" + str(i)
						var oriA = "oriA" + str(i)
						var oriB = "oriB" + str(i)
						var oriC = "oriC" + str(i)
						var oriD = "oriD" + str(i)
						var posA = "posA" + str(i)
						var posB = "posB" + str(i)
						var posC = "posC" + str(i)
						var posD = "posD" + str(i)
						var string = "str" + str(i)
						var yapper = "yapper" +  str(i)
						#for each variable, it checks if it's present in the JSON file.
						#if it is present, said var gets pushed into the respective array. Else, NULL gets pushed in
						#pushed var string
						#it only checks for the other variables if STRING is found
						if Conversation.has(string):  # Safely check if the key exists
							var stringvalue = Conversation[string]
							Global.text_array.push_back(stringvalue)
							#repeats this loop for every variable in the "allvars" array
							for p in range(0, Global.allvars_array.size()):
								#checks if this variable is present in the JSON file at position i
								if Conversation.has(Global.allvars_array[p] + str(i)):
									#if it is present, it will push back the value found at location i for variable var[p]
									Global.get(Global.allvars_array[p] + "_array").push_back(Conversation[(Global.allvars_array[p] + str(i))])
								else:	
									#if it's not present, it will push "NONE" into the array instead
									Global.get(Global.allvars_array[p] + "_array").push_back("NONE")
							# read through the JSON file, and finds everything with valuex for example
						else:
							print("dude you're missing the var string")
				else:
					print("'AAAA' key not found in 'Conversations'")
			else:
				print("'Conversations' key not found in JSON")
		else:
			print("JSON parsing error: ", json.get_error_message())
	else:
		print("File not found: res://JSON/Dialogue.json")
	pass
	
func display_label_text():
	dialogue.visible_ratio = 0
	
	Global.gatekeeping = true
	if text < Global.text_array.size():
		dialogue.text = Global.text_array[text]
		var string = Global.text_array[text]
		var length = string.length()
		var textspeed = length * 0.07

		#Change position by replacing the entire vector  
		#checks if there's a character at this spot in the conversation
		if Global.charA_array[text] != "NONE": 
			#it checks if this is the first line of dialogue
			if text != 0:
				#if it's not the first line of dialogue, it checks if the previous character matches the current character at that location
				if get_node("../%s" % Global.charA_array[text]) == get_node("../%s" % Global.charA_array[text-1]):
					#if they match, the character stays the same, and no one turns invisible, and plays the animation
					get_node("../%s" % Global.charA_array[text]).play(Global.animA_array[text])
					#checks if a position is given, otherwise, puts it at the default position for charA
					if Global.posA_array[text] == "NONE":
						get_node("../%s" % Global.charA_array[text]).set_position(Vector2(250, 300))
					else:
						get_node("../%s" % Global.charA_array[text]).set_position(Vector2(Global.posA_array[text]))
					#makes the character face either right or left, depending on the default position
					if Global.oriA_array[text] != "NONE":
						get_node("../%s" % Global.charA_array[text]).set_scale(Global.get(Global.oriA_array[text]))
					else:
						get_node("../%s" % Global.charA_array[text]).set_scale(Vector2(10, 10))
				else:
					if get_node("../%s" % Global.charA_array[text-1]) != get_node("../%s" % Global.charA_array[text]) and get_node("../%s" % Global.charA_array[text-1]) != get_node("../%s" % Global.charB_array[text]) and get_node("../%s" % Global.charA_array[text-1]) != get_node("../%s" % Global.charC_array[text]) and get_node("../%s" % Global.charA_array[text-1]) != get_node("../%s" % Global.charD_array[text]):
					#this if-case makes sure that the previous character doesnt match ANY of the current characters. So they only turn invisible if they're leaving field entirely
						get_node("../%s" % Global.charA_array[text]).visible = true
						get_node("../%s" % Global.charA_array[text-1]).visible = false
						get_node("../%s" % Global.charA_array[text]).play(Global.animA_array[text])
						#checks if a position is given, otherwise, puts it at the default position for charA
						if Global.posA_array[text] == "NONE":
							get_node("../%s" % Global.charA_array[text]).set_position(Vector2(250, 300))
						else:
							get_node("../%s" % Global.charA_array[text]).set_position(Vector2(Global.posA_array[text]))
						#makes the character face either right or left
						if Global.oriA_array[text] != "NONE":
							get_node("../%s" % Global.charA_array[text]).set_scale(Global.Global.oriA_array[text])
						else:
							get_node("../%s" % Global.charA_array[text]).set_scale(Vector2(10, 10))
			else:
				#if it's not the first line of dialogue, then there's no previous character, so no one to turn invisible
				get_node("../%s" % Global.charA_array[text]).visible = true
				get_node("../%s" % Global.charA_array[text]).play(Global.animA_array[text])
				#checks if a position is given, otherwise, puts it at the default position for charA
				if Global.posA_array[text] == "NONE":
					get_node("../%s" % Global.charA_array[text]).set_position(Vector2(250, 300))
				else:
					get_node("../%s" % Global.charA_array[text]).set_position(Vector2(Global.posA_array[text]))
				#makes the character face either right or left
				if Global.oriA_array[text] != "NONE":
					get_node("../%s" % Global.charA_array[text]).set_scale(Vector2(10, 10))
				else:
					get_node("../%s" % Global.charA_array[text]).set_scale(Global.Global.oriA_array[text])
		else:
			if text != 0 and get_node("../%s" % Global.charA_array[text-1]) != get_node("../%s" % Global.charA_array[text]) and get_node("../%s" % Global.charA_array[text-1]) != get_node("../%s" % Global.charB_array[text]) and get_node("../%s" % Global.charA_array[text-1]) != get_node("../%s" % Global.charC_array[text]) and get_node("../%s" % Global.charA_array[text-1]) != get_node("../%s" % Global.charD_array[text]):
			#if there is no current character on this position, the previous character should disappear
			#AND the previous character doesn't match ANY of the current characters
				get_node("../%s" % Global.charA_array[text-1]).visible = false
			
				

		#if Global.charB_array[text] != "NONE": 
			#get_node("../%s" % Global.charB_array[text]).play(Global.animB_array[text])
			#print(Global.posB_array[text])
			#if Global.posB_array[text] == "NONE":
				#get_node("../%s" % Global.charB_array[text]).set_position(Vector2(900, 300))
			#else:
				#get_node("../%s" % Global.charB_array[text]).set_position(Vector2(Global.posB_array[text]))
			#if Global.oriB_array[text] == "right":
				#get_node("../%s" % Global.charB_array[text]).set_scale(Vector2(10, 10))
			#else:
				#get_node("../%s" % Global.charB_array[text]).set_scale(Vector2(-10, 10))
##charC is broken right now
		#if Global.charC_array[text] != "NONE":
			#if text != 0 and Global.charC_array[text-1] != "NONE":
				#if Global.charC_array[text] == Global.charC_array[text-1]:
					#get_node("../%s" % Global.charC_array[text]).play(Global.animC_array[text])
					#if Global.posC_array[text] == "NONE":
						#get_node("../%s" % Global.charC_array[text]).set_position(Vector2(500, 300))
					#else:
						#get_node("../%s" % Global.charC_array[text]).set_position(Vector2(Global.posC_array[text]))
					#if Global.oriC_array[text] == "right":
						#get_node("../%s" % Global.charC_array[text]).set_scale(Vector2(10, 10))
					#else:
						#get_node("../%s" % Global.charC_array[text]).set_scale(Vector2(-10, 10))
				#else:
					#get_node("../%s" % Global.charC_array[text]).visible = true
					#get_node("../%s" % Global.charC_array[text-1]).visible = false
					#get_node("../%s" % Global.charC_array[text]).play(Global.animC_array[text])
					#if Global.posC_array[text] == "NONE":
						#get_node("../%s" % Global.charC_array[text]).set_position(Vector2(500, 300))
					#else:
						#get_node("../%s" % Global.charC_array[text]).set_position(Vector2(Global.posC_array[text]))
					#if Global.oriC_array[text] == "right":
						#get_node("../%s" % Global.charC_array[text]).set_scale(Vector2(10, 10))
					#else:
						#get_node("../%s" % Global.charC_array[text]).set_scale(Vector2(-10, 10))
			#else:
				#get_node("../%s" % Global.charC_array[text]).visible = true
				#get_node("../%s" % Global.charC_array[text]).play(Global.animC_array[text])
				#if Global.posC_array[text] == "NONE":
					#get_node("../%s" % Global.charC_array[text]).set_position(Vector2(500, 300))
				#else:
					#get_node("../%s" % Global.charC_array[text]).set_position(Vector2(Global.posC_array[text]))
				#if Global.oriC_array[text] == "right":
					#get_node("../%s" % Global.charC_array[text]).set_scale(Vector2(10, 10))
				#else:
					#get_node("../%s" % Global.charC_array[text]).set_scale(Vector2(-10, 10))
#
		#if Global.charD_array[text] != "NONE": 
			#get_node("../%s" % Global.charD_array[text]).play(Global.animD_array[text])
			#print(Global.posD_array[text])
			#if Global.posD_array[text] == "NONE":
				#get_node("../%s" % Global.charD_array[text]).set_position(Vector2(650, 300))
			#else:
				#get_node("../%s" % Global.charD_array[text]).set_position(Vector2(Global.posD_array[text]))
			#if Global.oriD_array[text] == "right":
				#get_node("../%s" % Global.charD_array[text]).set_scale(Vector2(10, 10))
			#else:
				#get_node("../%s" % Global.charD_array[text]).set_scale(Vector2(-10, 10))

		visible_text_tween = create_tween()
		visible_text_tween.tween_property(dialogue, "visible_ratio", 1.0, textspeed)
	
		text += 1
		
		await get_tree().create_timer(textspeed).timeout
		Global.gatekeeping = false
	else:
		Global.text_array = []
		
	#print(Global.gatekeeping)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
