extends Node2D

@onready var label = $Label
@onready var control = $Control

var visible_text_tween;
var hello := -1
var array = ["hello", "what is up?", "woop woop wa wa"]

func _ready() -> void:
	control.display_label_text.connect(display_label_text)

func display_label_text():

	label.visible_ratio = 0
	if hello <= 2:
		hello += 1
		label.text = array[hello]
		visible_text_tween = create_tween()
		visible_text_tween.tween_property(label, "visible_ratio", 1.0, 2.0)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
