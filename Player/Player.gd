extends KinematicBody2D

var motion = Vector2.ZERO
var moveVelocity

const SPEED = 1000
const GRAVITY = 200
const JUMPSPEED = 3500
const UP = Vector2(0,-1)

signal animateSignal

func _physics_process(_delta):
	apply_Gravity()
	Jump()
	Move()
	Animate()
	moveVelocity = move_and_slide(motion, UP)
	


func apply_Gravity():
	if is_on_floor():
		motion.y = 5  # instead of 0 to force a slight collision
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY


func Jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y -= JUMPSPEED


func Move():
	motion.x = 0
	if Input.is_action_pressed("left"):
		motion.x -= SPEED
	if Input.is_action_pressed("right"):
		motion.x += SPEED


func Animate():
	emit_signal("animateSignal", motion)
	
