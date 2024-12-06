extends Control

@onready var dialogue = $Dialogue

var visible_text_tween;
var text := 0

func _ready() -> void:
	Global.display_label_text.connect(display_label_text)
	
func display_label_text():
	dialogue.visible_ratio = 0
	
	Global.gatekeeping = true
	if text < Global.text_array.size():
		dialogue.text = Global.text_array[text]
		var string = Global.text_array[text]
		var length = string.length()
		length = length * 0.1
	 
		visible_text_tween = create_tween()
		visible_text_tween.tween_property(dialogue, "visible_ratio", 1.0, length)
	
		text += 1
		
		await get_tree().create_timer(length).timeout
		Global.gatekeeping = false
	else:
		Global.text_array = []
		print(Global.text_array.size()) 
	print(Global.gatekeeping)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
