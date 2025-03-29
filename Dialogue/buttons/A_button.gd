extends Control

@onready var button = $Button
@onready var A_button = $"."
var A_option = "xxxA"
#signal display_label_text

# Called when the node enters the scene tree for the first time.
func _ready():
	button.text = "option A"
	Global.buttonsappear.connect(buttonsappear)

func _on_button_pressed() -> void:
	if Global.dialogue_running == false:
		Global.setup_convo.emit(A_option)
	#else:
		#print("woop")
func buttonsappear():
	if Global.buttonAvalue != "NONE":
		button.text = Global.buttonAvalue
		#option is what ensues upon being pressed
		A_option = Global.optionAvalue
		A_button.visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
