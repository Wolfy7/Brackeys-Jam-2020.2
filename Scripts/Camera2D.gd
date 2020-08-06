extends Camera2D

var lockCamera = false

var _previousPosition: Vector2 = Vector2(0, 0);
var _moveCamera: bool = false;

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			_previousPosition = event.position
			_moveCamera = true
		else:
			_moveCamera = false
	elif event is InputEventMouseMotion && _moveCamera && !lockCamera:
		position += (_previousPosition - event.position)
		_previousPosition = event.position
