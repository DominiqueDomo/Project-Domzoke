extends CharacterBody2D

@onready var selfname = $".".get_name()
@onready var sprite = $AnimatedSprite2D

func _ready() -> void:
	Global.interacted.connect(interacted)
	sprite.play("idle")
	
func interacted(target):
	if target == selfname:
		Global.loadbackground.emit("res://Scenes/testmap2.tscn")
