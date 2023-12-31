extends Node2D

signal score

const SPEED = 190

func _physics_process(delta):
	position.x += -SPEED * delta

	if global_position.x <= -200:
		queue_free()

func _on_TopWall_body_entered(body):
	if body is Player:
		if body.has_method("die"):
			body.die()

func _on_ScoreArea_body_entered(body):
	if body is Player:
		$Point.play()
		emit_signal("score")
