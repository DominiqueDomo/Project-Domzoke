extends Node2D

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_title_pressed() -> void:
	if Global.dialogue_running == false:
		get_tree().change_scene_to_file("res://Scenes/title.tscn")
	pass # Replace with function body.
