extends Node2D

var taken = false

func _on_Area2D_body_entered(_body):
	if not taken:
		$AnimationPlayer.play("dissapear")
		RandomSFXPitch()
		$AudioStreamPlayer.play()
		get_tree().call_group("GameStateGroup", "Coin_Up")
		taken = true

func RandomSFXPitch():
	randomize()
	var pitch = 1.0 + rand_range(0.1, 0.8)
	$AudioStreamPlayer.pitch_scale = pitch

func Destroy():
	queue_free()


