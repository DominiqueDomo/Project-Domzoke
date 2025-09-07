extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.entrypoint1 = $entrypoint1
	print(Global.entrypoint1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
