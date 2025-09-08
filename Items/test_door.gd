extends StaticBody2D
#in order to use this item, the NODE of it must contain 2 labels; one for entrypoint and one for location
@onready var sprite = $AnimatedSprite2D
@onready var selfname = $".".get_name()
@onready var entrypointnum = $entrypoint.text
@onready var location = $location.text
func _ready() -> void:
	Global.hitbox_entered.connect(hitbox_entered)
	sprite.play("idle")

	
func hitbox_entered(target):
	if target == selfname:
		Global.loadbackground.emit(location, entrypointnum)
