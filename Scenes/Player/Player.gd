extends KinematicBody2D

var motion = Vector2(0,0)
export var SPEED : int  = 1000
export var GRAVITY : int = 250
export var MAX_FALL_SPEED : int = 3500
export var JUMPSPEED : int = 5000
const UP = Vector2.UP # sae as Vector2(0,-1)
var isJumping : bool = false

signal sigAnimate
 

func _physics_process(delta):
	move_and_slide(motion, UP)
	apply_gravity()

func _process(delta):
	Move()
	Jump()
	Animate()

func Move():
	motion.x = 0
	if Input.is_action_pressed("left"):
		motion.x -= SPEED
	if Input.is_action_pressed("right"):
		motion.x += SPEED

func apply_gravity():
	if is_on_floor():
		motion.y = GRAVITY
		isJumping = false
	elif is_on_ceiling():
		motion.y = GRAVITY
		isJumping = true
	else:
		motion.y += GRAVITY
		motion.y = clamp(motion.y,-JUMPSPEED,MAX_FALL_SPEED)
		# just to catch a possibly air jump when walking off a ledge
		if (motion.y > GRAVITY):
			isJumping = true

func Jump():
	if (Input.is_action_just_pressed("jump")) and isJumping == false:
		# heres a little catch, just in case we walk off a platform to stop air jump
		motion.y -= JUMPSPEED
		isJumping = true

func Animate():
	emit_signal("sigAnimate", motion, isJumping)

