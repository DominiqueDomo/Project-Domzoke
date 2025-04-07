extends Node2D

@onready var SouthWestIsland = $Map/SouthWestIsland
@onready var SouthEastBeach = $Map/SouthEastBeach

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Map.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#region SouthWestIsland
func _on_south_west_island_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			Global.setup_convo.emit("xxxD")

func _on_south_west_island_area_mouse_entered() -> void:
	print("in")
	Global.enddialogue.emit()
	SouthWestIsland.play("selected")

func _on_south_west_island_area_mouse_exited() -> void:
	print("out")
	SouthWestIsland.play("default")
#endregion
	

#region SouthEastBeach
func _on_south_east_beach_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			Global.setup_convo.emit("xxxF")


func _on_south_east_beach_area_mouse_entered() -> void:
	print("in")
	Global.enddialogue.emit()
	SouthEastBeach.play("selected")


func _on_south_east_beach_area_mouse_exited() -> void:
	print("out")
	SouthEastBeach.play("default")
#endregion
