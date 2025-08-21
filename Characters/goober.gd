extends CharacterBody2D

func _ready() -> void:
	$AnimatedSprite2D.play("idle_spin")

func _on_mouse_entered():
	print("at least it knows youre here")
	Global.setup_convo.emit("NewWorld")
