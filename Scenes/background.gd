extends Node2D
var background = null
var instance = null
var entrypointnum : String
@onready var camera = $"../Camera2D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.player = $"../player"
	Global.loadbackground.connect(loadbackground)
	loadbackground("res://Scenes/testmap.tscn", "1")
	pass # Replace with function body.
	
func loadbackground(bgloaded, entrypointnumtemp):
	Global.backgroundvalue = bgloaded
	entrypointnum = entrypointnumtemp
	$TransitionScreen/AnimationPlayer.play("fade_to_normal")
	
#this function triggers after the screen has faded to black
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_normal":
		transition()

#this is what changes the scene to the new bg
func transition():
	if is_instance_valid(instance):
		instance.queue_free()
	print(Global.backgroundvalue)
	if Global.backgroundvalue != "void":
		#this whole part changes the background of the scene
		background = load(Global.backgroundvalue)
		print("Changed background to " + str(background))
		instance = background.instantiate()
		add_child(instance)
		#this puts the player where they need to be
		var entrypointtest = Global.get("entrypoint"+ entrypointnum)
		(Global.player).position = entrypointtest.position
		#this makes sure the camera goes over to the player
		camera.position = (Global.player).position
	$TransitionScreen/AnimationPlayer.play("unblack")
