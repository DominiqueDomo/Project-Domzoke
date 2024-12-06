extends Node2D

@onready var dialogue = $Dialogue
@onready var button = $Button

var visible_text_tween;
var text_array = ["hello", "what is up?", "woop woop wa wa"]
var text := 0




func _ready() -> void:
	button.display_label_text.connect(display_label_text)
	
func display_label_text():
	dialogue.visible_ratio = 0
	
	Global.gatekeeping = true
	if text < text_array.size():
		Global.gatekeeping = false
		dialogue.text = text_array[text]
		var str = text_array[text]
		var length = str.length()
		length = length * 0.1
		print(length)
	 
		visible_text_tween = create_tween()
		visible_text_tween.tween_property(dialogue, "visible_ratio", 1.0, length)
		
		text += 1
	print(Global.gatekeeping)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
