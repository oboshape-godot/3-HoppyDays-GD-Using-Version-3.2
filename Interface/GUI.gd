extends CanvasLayer

func UpdateGUI(_lifeCount, _coins):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(_lifeCount)
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(_coins)
