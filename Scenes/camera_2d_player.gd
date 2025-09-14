extends Camera2D
@onready var player = $"../player"
@onready var egg = $"../Egg"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Global.followplayer == true:
		#if followplayer is true, then the camera's target will be the player, it's not rocket surgery
		Global.cameratarget = player.position
	position = ((position.lerp((Global.cameratarget + Global.cameraoffset), delta * 8))) 
