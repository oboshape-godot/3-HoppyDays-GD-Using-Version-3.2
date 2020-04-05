extends Node2D

var lives  = 3

func _ready():
	add_to_group("GameStateGroup")
	get_tree().call_group("UI", "UpdateLives",lives)
	
	
func Hurt():
	lives -= 1
	get_tree().call_group("UI", "UpdateLives",lives)
	if lives <= 0:
		end_game()
	else:
		$Player.Hurt()
	
	

func end_game():
	if get_tree().change_scene("res://Levels/GameOver.tscn") != OK :
		print("error changing scene on player.gd end_game()")
