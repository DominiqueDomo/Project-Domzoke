extends Node2D


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
 # Load the JSON file
	var file = File.new()
	var file_path = "res://JSONJSONTest.json" # Replace with the correct path
	if file.file_exists(file_path):
		file.open(file_path, File.READ)
		var json_data = file.get_as_text()
		file.close()
		
		# Parse the JSON data
		var parsed_json = JSON.parse(json_data)
		if parsed_json.error == OK:
			var data = parsed_json.result
			# Navigate to the desired section
			var conversations = data.get("Conversations", null)
			if conversations:
				var aaaa = conversations.get("AAAA", null)
				if aaaa:
					# Extract the strings from Str1 to Str6
					for i in range(1, 7): # From 1 to 6
						var key = "Str" + str(i)
						var value = aaaa.get(key, null)
						if value:
							print("Extracted value for ", key, ": ", value)
		else:
			print("JSON parsing error: ", parsed_json.error_string)
	else:
		print("File not found:", file_path)
	var array = ["hello", "what is up?", "woop woop wa wa", "yippie"]
	
	for i in range(array.size()):
		Global.text_array.push_back(array[i])
		#print(i)
		#print(Global.text_array[i])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
