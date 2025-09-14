extends Node2D
@onready var parent = $".".get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func y_level_changed():
	#this is supposed to make the player appear behind an object if the player is higher than that object
	if Global.player.position.y > parent:
		parent.Zindex = 2
	else:
		parent.Zindex = 0
