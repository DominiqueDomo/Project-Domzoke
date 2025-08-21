extends CharacterBody2D

@export var interact_label = "template" 
@export var interact_type = "dialogue"
@export var interact_value = "none"
@onready var sprite = $AnimatedSprite2D

func _ready() -> void:
	Global.interacted.connect(interacted)
	sprite.play("idle")
	
func interacted(target):
	if target == interact_label:
		print("hsjafhsaj")
		Global.setup_convo.emit("NewWorld")
