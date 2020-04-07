extends Area2D



func _on_JumpPad_body_entered(_body):
	$AnimationPlayer.play("Boost")
	$JumpSFX.play()
	_body.Boost()
