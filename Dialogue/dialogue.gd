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
						if Conversation.has(string):  # Safely check if the key exists
							var stringvalue = Conversation[string]
							Global.text_array.push_back(stringvalue)
						if Conversation.has(charA):
							var charAvalue = Conversation[charA]
							else:
							Global.text_array.push_back(stringvalue)
							var animAvalue = Conversation[animA]
							var posAvalue = Conversation[posA]
							
							# read through the JSON file, and finds everything with valuex for example
							
							var preloads = ("res://Characters/"+ charAvalue + ".tscn")
							print(preloads)
							load(preloads)
							Global.anim_array.push_back(animAvalue)
							Global.char_array.push_back(charAvalue)
							print("Extracted value for ", string, ": ", stringvalue)
							print("Extracted value for ", animA, ": ", animAvalue)
							
							#stores and loads those values, into an array, hoppa
						else:
							print("Key not found: ", string)
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

		get_node("../%s" % Global.char_array[text]).play(Global.anim_array[text])
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
