extends Control

@onready var dialogue = $Dialogue

var visible_text_tween;
var text := 0

func _ready() -> void:
	Global.display_label_text.connect(display_label_text)
	Global.setup_convo.connect(setup_convo)
	
			# Load the JSON file

func setup_convo(convo):
	var file = FileAccess.open("res://JSON/JSONTest.json", FileAccess.READ)
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

				# Extract the strings from Str1 to Str6
					for i in range(1, 7):  # From 1 to 6
						var string = "str" + str(i)
						if Conversation.has(string):  # Safely check if the key exists
							var value = Conversation[string]
							Global.text_array.push_back(value)
							print("Extracted value for ", string, ": ", value)
						else:
							print("Key not found: ", string)
				else:
					print("'AAAA' key not found in 'Conversations'")
			else:
				print("'Conversations' key not found in JSON")
		else:
			print("JSON parsing error: ", json.get_error_message())
	else:
		print("File not found: res://JSON/JSONTest.json")
	pass
	
func display_label_text():
	dialogue.visible_ratio = 0
	
	Global.gatekeeping = true
	if text < Global.text_array.size():
		dialogue.text = Global.text_array[text]
		var string = Global.text_array[text]
		var length = string.length()
		length = length * 0.1
	 
		visible_text_tween = create_tween()
		visible_text_tween.tween_property(dialogue, "visible_ratio", 1.0, length)
	
		text += 1
		
		await get_tree().create_timer(length).timeout
		Global.gatekeeping = false
	else:
		Global.text_array = []
		
	#print(Global.gatekeeping)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
