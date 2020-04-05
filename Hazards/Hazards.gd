extends Area2D



func _on_SpikeTop_body_entered(_body):
	get_tree().call_group("GameStateGroup", "Hurt")
