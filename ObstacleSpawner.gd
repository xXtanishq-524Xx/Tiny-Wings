extends Node2D

signal obstacle_created(obs)

var Obstacle = preload("res://environment/Obstacle.tscn")

func _ready():
	randomize()

func start():
	$Timer.start()

func stop():
	$Timer.stop()

func _on_Timer_timeout():
	spawn_obstacle()

func spawn_obstacle():
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	obstacle.position.y = randi()%231 + 170
	emit_signal("obstacle_created", obstacle)
