extends Control

@onready var button = $Button
@onready var B_button = $"."
var B_option = "AAAB"
#signal display_label_text

# Called when the node enters the scene tree for the first time.
func _ready():
	button.text = "option B"
	Global.buttonsappear.connect(buttonsappear)

func _on_button_pressed() -> void:
	if Global.dialogue_running == false:
		Global.setup_convo.emit(B_option)
		Global.display_label_text.emit()
	#else:
		#print("woop")
func buttonsappear():
	if Global.buttonBvalue != "NONE":
		button.text = Global.buttonBvalue
		#option is what ensues upon being pressed
		B_option = Global.optionBvalue
		B_button.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
