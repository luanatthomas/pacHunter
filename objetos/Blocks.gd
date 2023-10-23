extends Area2D

func _input(event: InputEvent):
	if event is InputEventMouseButton:
		var mousePos = event.position
		if event.is_pressed() && mousePos.x >= position.x -30 && mousePos.x <= position.x +30 && mousePos.y >= position.y -30 && mousePos.y <= position.y +30:
			queue_free()
