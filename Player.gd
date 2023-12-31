extends RigidBody2D

class_name Player

signal died

export var FLAP_FORCE = -200

const MAX_ROTATION_DEGREES = -30.0

var started = false
var alive = true

func _ready():
	gravity_scale = 0

func _physics_process(_delta):
	if Input.is_action_just_pressed("flap") && alive:
		if !started:
			start()
		flap()

	if rotation_degrees <= MAX_ROTATION_DEGREES:
		angular_velocity = 0
		rotation_degrees = MAX_ROTATION_DEGREES
	if linear_velocity.y > 300:
		angular_velocity = 8.0
		if rotation_degrees >= 90.0:
			angular_velocity = 0

func start():
	if started: return
	started = true
	gravity_scale = 6.0
	$AnimationPlayer.play("flap")

func flap():
	linear_velocity.y = FLAP_FORCE
	angular_velocity = -8.0
	$Wing.play()

func die():
	if !alive: return
	alive = false
	$AnimationPlayer.stop()
	$Hit.play()
	emit_signal("died")
