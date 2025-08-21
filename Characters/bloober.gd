extends CharacterBody2D


@export var interact_label = "E" 
@export var interact_type = "dialogue"
@export var interact_value = "none"

func _ready() -> void:
	$AnimatedSprite2D.play("idle")
