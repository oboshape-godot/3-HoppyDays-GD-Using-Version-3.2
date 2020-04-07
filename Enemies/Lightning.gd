extends Node2D

const SPEED = 350

func _ready():
	set_as_toplevel(true)
	global_position = get_parent().global_position


func _process(_delta):
	position.y += SPEED * _delta
	Manage_Collision()


func Manage_Collision():
	var collider = $Area2D.get_overlapping_bodies()
	for obj in collider:
		if obj.name == "Player":
			get_tree().call_group("GameStateGroup", "Hurt")
		queue_free()
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
