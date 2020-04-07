extends KinematicBody2D

var motion = Vector2.ZERO
var moveVelocity # not used only to stop move and slide warnings

const SPEED = 1000
const GRAVITY = 200
const JUMPSPEED = 3500
const UP = Vector2(0,-1)
const WORLD_LIMIT = 3000
const BOOST_MULTIPLIER = 1.5
signal animateSignal

func _physics_process(_delta):
	apply_Gravity()
	Jump()
	Move()
	Animate()
	moveVelocity = move_and_slide(motion, UP)



func apply_Gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("GameStateGroup", "end_game")
	elif is_on_floor() and motion.y > 0:
		motion.y = 1  # instead of 0 to force a slight collision
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY



func Jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y -= JUMPSPEED
		$AudioStreamPlayer_Jump_SFX.play()


func Move():
	motion.x = 0
	if Input.is_action_pressed("left"):
		motion.x -= SPEED
	if Input.is_action_pressed("right"):
		motion.x += SPEED


func Animate():
	emit_signal("animateSignal", motion)


func Hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = -JUMPSPEED
	$AudioStreamPlayer_Hurt_SFX.play()

func Boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")

	motion.y = -JUMPSPEED * BOOST_MULTIPLIER
