extends CanvasLayer

func UpdateLives(_lifeCount):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(_lifeCount)
