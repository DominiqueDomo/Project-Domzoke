extends StaticBody2D

@export var interact_label = "Egg" 
@onready var sprite = $AnimatedSprite2D
@onready var selfname = $".".get_name()
func _ready() -> void:
	Global.interacted.connect(interacted)
	sprite.play("idle")
	
func interacted(target):
	if target == selfname:
		Global.setup_convo.emit("Egg")
