extends CharacterBody2D
@onready var InteractionComponents = $InteractionComponents
@onready var all_interactions = []
@onready var interactLabel = $InteractionComponents/InteractLabel


var last_direction = Vector2(1, 0)
const SPEED = 100.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	if Global.dialogue_running != true:
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		if direction == Vector2(0, -1):
			InteractionComponents.rotation_degrees = 0
		elif direction == Vector2(0, 1):
			InteractionComponents.rotation_degrees = 180
		elif direction == Vector2(-1, 0):
			InteractionComponents.rotation_degrees = 270
		elif direction == Vector2(1, 0):
			InteractionComponents.rotation_degrees = 90
		velocity = direction * SPEED
		move_and_slide()
		if direction.length() > 0:
			last_direction = direction
			play_walk_animation(direction)
		else: 
			play_idle_animation(last_direction)
	else: 
		play_idle_animation(last_direction)
		
func play_walk_animation(direction):
	var posx
	var posy
	var scalex
	var scaley
	if direction.x > 0:
		$AnimatedSprite2D.play("move_right")
		posx = 11
		posy = -6
	elif direction.x < 0:
		$AnimatedSprite2D.play("move_left")
	elif direction.y > 0:
		$AnimatedSprite2D.play("move_down")
	elif direction.y < 0:
		$AnimatedSprite2D.play("move_up")
	#$interactHitbox/CollisionShape2D2.set_position(Vector2(posx, posy))
	#$interactHitbox/CollisionShape2D2.set_scale(Vector2(scalex, scaley))

func play_idle_animation(direction):
	if direction.x > 0:
		$AnimatedSprite2D.play("idle_right")
	elif direction.x < 0:
		$AnimatedSprite2D.play("idle_left")
	elif direction.y > 0:
		$AnimatedSprite2D.play("idle_down")
	elif direction.y < 0:
		$AnimatedSprite2D.play("idle_up")



func _on_interaction_area_area_entered(area):
	all_interactions.insert(0, area)
	print(all_interactions)
	update_interactions()

func _on_interaction_area_area_exited(area):
	all_interactions.erase(area)
	update_interactions()

func update_interactions():
	if all_interactions:
		interactLabel.text = all_interactions[0].interact_label
		print(get_node("res://Characters/bloober.tscn"))
	else:
		interactLabel.text = ""
	
