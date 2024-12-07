extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var array = ["hello", "what is up?", "woop woop wa wa", "yippie"]
	
	for i in range(array.size()):
		Global.text_array.push_back(array[i])
		#print(i)
		#print(Global.text_array[i])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
