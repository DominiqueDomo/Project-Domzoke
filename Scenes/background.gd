extends Node2D
var background = null
var instance = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.loadbackground.connect(loadbackground)
	loadbackground("res://Scenes/testmap.tscn")
	pass # Replace with function body.
	
func loadbackground(bgloaded):
	if is_instance_valid(instance):
		instance.queue_free()
	print(bgloaded)
	if bgloaded != "void":
		background = load(bgloaded)
		print(background)
		instance = background.instantiate()
		add_child(instance)
