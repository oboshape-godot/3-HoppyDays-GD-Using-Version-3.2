extends AnimatedSprite



func _on_Player_animateSignal(_motion):
	print("animation signal")
	if _motion.y < 0 :
		play("jump")
	elif _motion.x != 0 :
		play("walk")
		if _motion.x > 0 :
			flip_h = false
		else:
			flip_h = true
	else:
		play("idle")
