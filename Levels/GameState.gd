extends Node2D

var lives  = 3
var coins = 0
var coinsNeededForAnotherLife = 10


func _ready():
	add_to_group("GameStateGroup")
	UpdateGUI()


func Hurt():
	lives -= 1
	UpdateGUI()
	if lives <= 0:
		end_game()
	else:
		$Player.Hurt()


func Coin_Up():
	coins += 1
	UpdateGUI()
	if (coins % coinsNeededForAnotherLife) == 0:
		LifeUp()


func UpdateGUI():
	get_tree().call_group("UI", "UpdateGUI",lives, coins)

func LifeUp():
	lives += 1
	UpdateGUI()


func end_game():
	if get_tree().change_scene("res://Levels/GameOver.tscn") != OK :
		print("error changing scene on player.gd end_game()")

func win_game():
	if get_tree().change_scene("res://Levels/Victory.tscn") != OK :
		print("error win game change scene not working!")
