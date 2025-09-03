extends CharacterBody2D

@onready var selfname = $".".get_name()
@onready var sprite = $AnimatedSprite2D

func _ready() -> void:
	Global.interacted.connect(interacted)
	sprite.play("idle")
	
func interacted(target):
	"Interacted with something"
	if target == selfname:
		print("interacted with Beeber")
		Global.loadbackground.emit("res://Scenes/testmap2.tscn")
