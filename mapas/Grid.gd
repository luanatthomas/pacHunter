extends TileMap

onready var gridLines := $GridLines

func _process(delta: float):
	var worldSize = world_to_map(get_viewport().size)
	var quantColumns = worldSize.y - 1
	var quantLines = worldSize.x - 1

	print(quantLines)

	var mouse_position = get_viewport().get_mouse_position()
	var cell := world_to_map(mouse_position)
	var tile_pos = map_to_world(world_to_map(mouse_position))
	print(cell)
	
	if cell.x > 0 && cell.x < quantLines && cell.y > 0 && cell. y < quantColumns:
		gridLines.set_cellv(cell, 1)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
