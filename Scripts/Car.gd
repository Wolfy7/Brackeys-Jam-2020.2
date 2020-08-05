extends Node2D

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		$RigidBody2D.angular_velocity = 10
	if Input.is_action_pressed("ui_left"):
		$RigidBody2D.angular_velocity = -10
