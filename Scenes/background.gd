extends Node2D
var background = null
var instance = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.loadbackground.connect(loadbackground)
	pass # Replace with function body.
	
func loadbackground(bgloaded):
	if is_instance_valid(instance):
		instance.queue_free()
	if bgloaded != "void":
		background = load(bgloaded)
		instance = background.instantiate()
		add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
