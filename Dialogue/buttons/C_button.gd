extends Control

@onready var button = $Button
@onready var C_button = $"."
var C_option = "xxxC"
#signal display_label_text

# Called when the node enters the scene tree for the first time.
func _ready():
	button.text = "option C"
	Global.buttonsappear.connect(buttonsappear)

func _on_button_pressed() -> void:
	if Global.dialogue_running == false:
		Global.setup_convo.emit(C_option)
	#else:
		#print("woop")
func buttonsappear():
	if Global.buttonCvalue != "NONE":
		#button is the displayed text
		button.text = Global.buttonCvalue
		#option is what ensues upon being pressed
		C_option = Global.optionCvalue
		C_button.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
