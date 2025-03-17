extends Control

@onready var button = $Button
@onready var D_button = $"."
var D_option = "xxxD"
#signal display_label_text


# Called when the node enters the scene tree for the first time.
func _ready():
	button.text = "option D"
	Global.buttonsappear.connect(buttonsappear)

func _on_button_pressed() -> void:
	if Global.dialogue_running == false:
		Global.setup_convo.emit(D_option)
		Global.display_label_text.emit()
	#else:
		#print("woop")
func buttonsappear():
	if Global.buttonDvalue != "NONE":
		button.text = Global.buttonDvalue
		#option is what ensues upon being pressed
		D_option = Global.optionDvalue
		D_button.visible = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
