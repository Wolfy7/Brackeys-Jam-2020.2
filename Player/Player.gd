extends KinematicBody2D

export var speed = 200.0

const GRAVITY = 200.0

enum{
	IDLE,
	REWINDING,
	DRIVING,
	EXPIRED,
	STOPPED
}

var state = IDLE

onready var timer = $Timer
onready var stopwatch = $Stopwatch
onready var anim = $AnimationPlayer
onready var key = $Winding_key

var velocity = Vector2();

func _ready():
	pass

func _unhandled_input(event):
	if event.is_action_pressed("rewind"):
		print("start rewinding")
		if state == IDLE:
			state = REWINDING
		
			stopwatch.visible = true
			#anim.play("start_rewind")
			#yield(anim, "animation_finished")
			key.visible = true
			anim.play("rewind")
		
	if event.is_action_released("rewind"):
		print("stop rewinding")
		if state == REWINDING:
			state = IDLE
			
			#anim.play("stop_rewind")
			#yield(anim, "animation_finished")
			stopwatch.visible = false
			#key.visible = false
			anim.stop(false)
		
	if event.is_action_pressed("get_started"):
		get_started()

func _process(delta):
	if state == REWINDING:
		stopwatch.seconds += delta 
	
	if is_on_floor() and state == EXPIRED:
		state = STOPPED
		velocity.x = 0
		anim.play("idel")

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	velocity = move_and_slide(velocity, Vector2.UP, true)

func _on_Timer_timeout():
	state = EXPIRED
	stopwatch.seconds = 0 


func _on_Player_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("clicked")

func get_started():
	var seconds = stopwatch.seconds
	if seconds > 0:
		state = DRIVING
		anim.play("stop_rewind")
		yield(anim, "animation_finished")
		timer.wait_time = seconds
		timer.start()
		velocity.x = speed
		anim.play("drive")
