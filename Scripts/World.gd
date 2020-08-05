extends Node2D


onready var goal = $Goal
onready var player = $Player
onready var camera = $Camera2D

var is_inGoal = false

# Called when the node enters the scene tree for the first time.
func _ready():
	camera.position = player.position
	
var _previousPosition: Vector2 = Vector2(0, 0);
var _moveCamera: bool = false;

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			_previousPosition = event.position
			_moveCamera = true
		else:
			_moveCamera = false
	elif event is InputEventMouseMotion && _moveCamera:
		camera.position += (_previousPosition - event.position)
		_previousPosition = event.position


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
