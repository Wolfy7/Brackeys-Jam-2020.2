extends Node2D


onready var goal = $Goal
onready var player = $Player

var is_inGoal = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	check_finish()

func check_finish():
	if is_inGoal and player.state == player.STOPPED:
		yield(get_tree().create_timer(0.2), "timeout")
		goal.fire_firework()
	elif player.state == player.STOPPED:
		yield(get_tree().create_timer(0.5), "timeout")
		print("You Lose")
		get_tree().reload_current_scene()

func _on_Goal_body_entered(body):
	print(body.name + " entered")
	is_inGoal = true

func _on_Goal_body_exited(body):
	print(body.name + " exited")
	is_inGoal = false
