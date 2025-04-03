extends TileMapLayer

@onready var torch1 = $Torch1
@onready var torch2 = $Torch2
@onready var torch3 = $Torch3
@onready var torch4 = $Torch4
@onready var torch5 = $Torch5
@onready var torch6 = $Torch6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	torch1.play("unlit")
	torch2.play("unlit")
	torch3.play("unlit")
	torch4.play("unlit")
	torch5.play("unlit")
	torch6.play("unlit")
	
	await get_tree().create_timer(0.5).timeout
	torch3.play("lit")
	torch4.play("lit")
	await get_tree().create_timer(0.5).timeout
	torch2.play("lit")
	torch5.play("lit")
	await get_tree().create_timer(0.5).timeout
	torch1.play("lit")
	torch6.play("lit")
	
	#for i in range(1,7):
		#get_node("../%s" % "torch" + str(i)).play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
