extends StaticBody2D

@onready var sprite = $AnimatedSprite2D
@onready var selfname = $".".get_name()
@onready var isspinning = false
@onready var spintime = 0
@onready var spinvelocity = 0
@onready var spinmodifier
func _ready() -> void:
	Global.interacted.connect(interacted)

	#sprite.play("idle_spin")
	
func interacted(target):
	if target == selfname:
		isspinning = true
		spintime = 1
		sprite.rotation_degrees = 0
		var rng = RandomNumberGenerator.new()
		spinvelocity = 30
		spinmodifier = rng.randf_range(0.0001, 0.00001)
func _process(delta: float) -> void:
	if isspinning == true:
		if spinvelocity >= 0:
			spintime += 1
			sprite.rotation_degrees += spinvelocity
			if spintime >= 50:
				spinvelocity = 1/(spinmodifier*((spintime-20)+0.1)**2)-0.15
			if sprite.rotation_degrees >= 360:
				sprite.rotation_degrees -= 360
		else:
			isspinning = false
			gambleresults()
func gambleresults():
	var bust = "bust"
	var winner = "maybe I'll take it all!"
#if the wheel stops at any of these locations, it means you lose!
	if (sprite.rotation_degrees >= 314 and sprite.rotation_degrees < 359) or (sprite.rotation_degrees >= 44 and sprite.rotation_degrees < 89) or (sprite.rotation_degrees >= 224 and sprite.rotation_degrees < 269) or (sprite.rotation_degrees >= 134 and sprite.rotation_degrees < 179):
		print(bust)
#if the wheel stopped at any of these locations, it means you win!
	if (sprite.rotation_degrees >= 269 and sprite.rotation_degrees < 314) or (sprite.rotation_degrees >= 0 and sprite.rotation_degrees < 44) or (sprite.rotation_degrees >= 89 and sprite.rotation_degrees < 134)or (sprite.rotation_degrees >= 179 and sprite.rotation_degrees < 224) or (sprite.rotation_degrees >= 359):
		print(winner)
