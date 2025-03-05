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
					for i in range(1, Conversation.size()):  # From 1 to convlength
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
						# Pushes var charA
							if Conversation.has(charA):
								Global.charAvalue = Conversation[charA]
								var preloads = "res://Characters/" + Global.charAvalue + ".tscn"
								Global.charA_array.push_back(Global.charAvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var charB
							if Conversation.has(charB):
								Global.charBvalue = Conversation[charB]
								var preloads = "res://Characters/" + Global.charBvalue + ".tscn"
								Global.charB_array.push_back(Global.charBvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var charC
							if Conversation.has(charC):
								Global.charCvalue = Conversation[charC]
								var preloads = "res://Characters/" + Global.charCvalue + ".tscn"
								Global.charC_array.push_back(Global.charCvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var charD
							if Conversation.has(charD):
								Global.charDvalue = Conversation[charD]
								var preloads = "res://Characters/" + Global.charDvalue + ".tscn"
								Global.charD_array.push_back(Global.charDvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var animA
							if Conversation.has(animA):
								Global.animAvalue = Conversation[animA]
								Global.animA_array.push_back(Global.animAvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var animB
							if Conversation.has(animB):
								Global.animBvalue = Conversation[animB]
								Global.animB_array.push_back(Global.animBvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var animC
							if Conversation.has(animC):
								Global.animCvalue = Conversation[animC]
								Global.animC_array.push_back(Global.animCvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var animD
							if Conversation.has(animD):
								Global.animDvalue = Conversation[animD]
								Global.animD_array.push_back(Global.animDvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var oriA
							if Conversation.has(oriA):
								Global.oriAvalue = Conversation[oriA]
								Global.oriA_array.push_back(Global.oriAvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var oriB
							if Conversation.has(oriB):
								Global.oriBvalue = Conversation[oriB]
								Global.oriB_array.push_back(Global.oriBvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var oriC
							if Conversation.has(oriC):
								Global.oriCvalue = Conversation[oriC]
								Global.oriC_array.push_back(Global.oriCvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var oriD
							if Conversation.has(oriD):
								Global.oriDvalue = Conversation[oriD]
								Global.oriD_array.push_back(Global.oriDvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var posA
							if Conversation.has(posA):
								Global.posAvalue = Conversation[posA]
								Global.posA_array.push_back(Global.posAvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var posB
							if Conversation.has(posB):
								Global.posBvalue = Conversation[posB]
								Global.posB_array.push_back(Global.posBvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var posC
							if Conversation.has(posC):
								Global.posCvalue = Conversation[posC]
								Global.posC_array.push_back(Global.posCvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var posD
							if Conversation.has(posD):
								Global.posDvalue = Conversation[posD]
								Global.posD_array.push_back(Global.posDvalue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var yapper
							if Conversation.has(yapper):
								Global.yapperValue = Conversation[yapper]
								Global.yapper_array.push_back(Global.yapperValue)
							else:
								Global.text_array.push_back("NULL")

							# Pushes var text
							if Conversation.has(text):
								Global.textValue = Conversation[text]
								Global.text_array.push_back(Global.textValue)
							else:
								Global.text_array.push_back("NULL")
							
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
		if Global.charA_array[text] != "NULL":
			get_node("../%s" % Global.charA_array[text]).play(Global.animA_array[text])
			print(Global.posA_array[text])
			#if Global.posA_array[text] == "NULL":
				#get_node("../%s" % Global.charA_array[text]).set_position(Vector2(250, 300))
			#else:
				#get_node("../%s" % Global.charA_array[text]).set_position(Vector2(Global.posA_array[text]))	
			
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
