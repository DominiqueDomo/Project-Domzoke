extends Area2D
#in order to use this item, the NODE of it must contain 2 labels; one for entrypoint and one for location
@onready var entrypointnum = $entrypoint.text
@onready var location = $location.text
@onready var selfname = $".".get_name()

func _ready() -> void:
	Global.interacted.connect(hitboxentered)
	print(selfname)
	
func hitboxentered(target):
	print(target + ": " + selfname)
	if target == selfname:
		Global.loadbackground.emit(location, entrypointnum)
