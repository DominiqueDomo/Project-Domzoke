extends TileMapLayer

@onready var moon = $Moon
@onready var stars = $Stars

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	moon.play("default")
	await get_tree().create_timer(0.1).timeout
	stars.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
