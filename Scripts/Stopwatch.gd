extends Node2D

export(int, 0,9,1) var max_seconds = 9 

onready var label = $Label
onready var sprite = $Sprite

var seconds = 0 setget set_seconds, get_seconds

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = str(int(seconds))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_seconds():
	return seconds

func set_seconds(new_seconds):
	seconds = clamp(new_seconds, 0, max_seconds)
	#print(seconds)
	set_frame()

func set_frame():
	var frame = round((seconds - int(seconds)) / 0.125)
	sprite.frame = frame
	label.text = str(int(seconds))
	
func is_full():
	return (seconds == max_seconds)
