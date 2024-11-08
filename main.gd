extends Node2D

@onready var text = $Label
@onready var button = $Button


func _ready():
	button.text = "Click me"
	button.pressed.connect(self._button_pressed)
	text.text = str("helloseafdxghc")
	

func _button_pressed():
	var speed = 0
	print("Hello world!")
	while speed < 1:
		speed += 0.1
		await get_tree().create_timer(0.5).timeout
		text.visible_ratio = speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
