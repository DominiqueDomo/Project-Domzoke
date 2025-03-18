extends TileMapLayer

@onready var sun = $Sun
@onready var clouds = $Clouds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sun.play("default")
	clouds.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
