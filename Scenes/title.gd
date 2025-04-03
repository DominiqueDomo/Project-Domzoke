extends Node2D

@onready var torch1 = $Torch1
@onready var torch2 = $Torch2
@onready var torch3 = $Torch3
@onready var torch4 = $Torch4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	torch1.play("unlit")
	torch2.play("unlit")
	torch3.play("unlit")
	torch4.play("unlit")
	
	
	await get_tree().create_timer(0.5).timeout
	torch1.play("lit")
	torch4.play("lit")
	await get_tree().create_timer(0.5).timeout
	torch2.play("lit")
	torch3.play("lit")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	Global.setup_convo.emit("xxxA")
	print(Global.charA_array)


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
