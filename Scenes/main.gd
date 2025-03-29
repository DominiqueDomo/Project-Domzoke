extends Node2D

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_title_pressed() -> void:
	Global.enddialogue.emit()
	$IslandMap.visible = true
	pass # Replace with function body.
