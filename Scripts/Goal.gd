extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func fire_firework():
	for child in get_children():
		if child.has_method("set_emitting"):
			child.emitting = true
			yield(get_tree().create_timer(0.5), "timeout")
