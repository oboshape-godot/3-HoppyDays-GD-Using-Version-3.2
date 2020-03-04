extends AnimatedSprite



func _on_Player_sigAnimate(_motion, _isJumping):
	if(_isJumping == true):
		play("jump")
	elif (_motion.x != 0):
		play("walk")
		if (_motion.x > 0):
			flip_h = false
		else:
			flip_h = true	
	else:
		play("idle")
