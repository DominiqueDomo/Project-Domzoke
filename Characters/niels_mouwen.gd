extends StaticBody2D

@export var interact_label = "NielsMouwen" 
@onready var sprite = $AnimatedSprite2D
@onready var selfname = $".".get_name()
func _ready() -> void:
	Global.interacted.connect(interacted)
	sprite.play("idle")
	
func interacted(target):
	if target == interact_label:
		Global.setup_convo.emit("NielsMouwen")
