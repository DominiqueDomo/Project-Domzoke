extends CharacterBody2D

var last_direction = Vector2(1, 0)
const SPEED = 100.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	if direction.length() > 0:
		last_direction = direction
		play_walk_animation(direction)
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
