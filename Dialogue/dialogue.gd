extends Control

@onready var dialogue = $Dialogue
@onready var NameTag = $NameTag

var visible_text_tween;
var text := 0

func _ready() -> void:
	Global.display_label_text.connect(display_label_text)
	Global.setup_convo.connect(setup_convo)
	
func setup_convo(convo):
	var file = FileAccess.open("res://JSON/Dialogue.json", FileAccess.READ)
	text = 0
	Global.gatekeeping = false
	Global.dialogue_running = true
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
							var string = "str" + str(i)
							if Conversation.has(string):
								print(i)
								i += 1
							else:
								Global.convlengthfound = true
								Global.convlength = i
								print(Global.convlength)

					for i in range(1, Global.convlength):  # From 1 to convlength
						var string = "str" + str(i)
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
					print("'" + str(convo) + "' key not found in 'Conversations'")
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
		NameTag.text = Global.yapper_array[text] + ":"
		dialogue.text = Global.text_array[text]
		var string = Global.text_array[text]
		var length = string.length()
		var textspeed = length * 0.06

		#Change position by replacing the entire vector  
		#checks if there's a character at this spot in the conversation
		for p in range(0, 3):
			#checks if previous character matches ANY of the current characters; if they don't match, then removes previous character
			#it also just doesn't activate if it's on line 0, because there is no value -1
			if text != 0:
				if get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1]) != get_node("../%s" % Global.charA_array[text]) and get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1]) != get_node("../%s" % Global.charB_array[text]) and get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1]) != get_node("../%s" % Global.charC_array[text]) and get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text-1]) != get_node("../%s" % Global.charD_array[text]):
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
					get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).set_position(Vector2(Global.get("pos" + Global.allchartypes_array[p] + "_array")[text]))
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
						get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).set_scale(Vector2(-10, 10))
			#makes character visible
				get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).visible = true
			#makes character play correct animation
				get_node("../%s" % Global.get("char" + Global.allchartypes_array[p] + "_array")[text]).play(Global.get("anim" + Global.allchartypes_array[p] + "_array")[text])
					
		visible_text_tween = create_tween()
		visible_text_tween.tween_property(dialogue, "visible_ratio", 1.0, textspeed)
	
		text += 1
		
		await get_tree().create_timer(textspeed).timeout
		Global.gatekeeping = false
	else:
		NameTag.text = ""
		Global.text_array = []
		Global.dialogue_running = false
		for t in range (0, Global.allvars_array.size()):
			Global.set(Global.allvars_array[t] + "_array", [])
			print(Global.get(Global.allvars_array[t] + "_array"))
		
	#print(Global.gatekeeping)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
