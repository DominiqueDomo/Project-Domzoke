extends Control

@onready var button = $Button

#signal display_label_text

# Called when the node enters the scene tree for the first time.
func _ready():
	button.text = "option A"

func _on_button_pressed() -> void:
	if Global.dialogue_running == false:
		Global.setup_convo.emit("AAAA")
		Global.display_label_text.emit()
	#else:
		#print("woop")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
