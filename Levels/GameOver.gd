extends Control



func _on_RestartButton_pressed():
	if get_tree().change_scene("res://Levels/Level.tscn") != OK:
		print ("error in GameOver.gd _on_restartButton_pressed()")
