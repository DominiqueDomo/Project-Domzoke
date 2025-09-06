extends StaticBody2D

@onready var sprite = $AnimatedSprite2D
@onready var selfname = $".".get_name()
func _ready() -> void:
	Global.interacted.connect(interacted)
	sprite.play("idle")
	
func interacted(target):
	if target == selfname:
		Global.loadbackground.emit("res://Scenes/secret_room.tscn")
