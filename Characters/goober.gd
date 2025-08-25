extends StaticBody2D

@onready var sprite = $AnimatedSprite2D
@export var interact_label = "Goober" 
func _ready() -> void:
	Global.interacted.connect(interacted)
	sprite.play("idle_spin")
	
func interacted(target):
	if target == interact_label:
		Global.setup_convo.emit("NewWorld")
