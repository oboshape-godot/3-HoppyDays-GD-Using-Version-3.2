extends Node2D

var lightningBolt = preload("res://Enemies/Lightning.tscn")
var fireTimeout = false

func _process(_delta):
	if $Sprite/RayCast2D.is_colliding():
		Fire()


func Fire():
	if fireTimeout == false:
		$Sprite/RayCast2D.add_child(lightningBolt.instance())
		$Sprite/Timer.start()
		fireTimeout = true

func _on_Timer_timeout():
	fireTimeout = false
