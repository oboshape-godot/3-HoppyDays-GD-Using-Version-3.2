extends Control

func _ready():
	pass


func _on_RestartButton_pressed():
	get_tree().change_scene("res://Levels/Level1/Level1.tscn")
