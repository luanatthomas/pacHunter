extends TileMap

onready var gridLines := $GridLines
onready var pacman := $Pacman

export (PackedScene) var blockLeft : PackedScene
export (PackedScene) var blockRight : PackedScene
export (PackedScene) var blockUp : PackedScene
export (PackedScene) var blockDown : PackedScene
export (PackedScene) var blockStop : PackedScene

var selectedBlock := 0

func _process(delta: float):
	var worldSize = world_to_map(get_viewport().size)
	var quantColumns = worldSize.y - 1
	var quantLines = worldSize.x - 1

	gridLines.clear()
#	for l in range(1, quantLines):
#		for c in range(1, quantColumns):
#			gridLines.set_cellv(Vector2(l, c), 0)

	var mouse_position = get_viewport().get_mouse_position()
	var cell := world_to_map(mouse_position)
	var tile_pos = map_to_world(world_to_map(mouse_position))
	
	if cell.x > 0 && cell.x < quantLines && cell.y > 0 && cell. y < quantColumns:
		gridLines.set_cellv(cell, selectedBlock)
		
func _input(event):
	if event is InputEventKey:
		if (event.is_action_pressed("up")):
			selectedBlock = 5
		elif event.is_action_pressed("down"):
			selectedBlock = 2
		elif event.is_action_pressed("left"):
			selectedBlock = 3
		elif event.is_action_pressed("right"):
			selectedBlock = 4
		elif event.is_action_pressed("block"):
			selectedBlock = 1
	elif event is InputEventMouseButton:
		if event.pressed:
			
			match selectedBlock:
				1:
					var b = blockStop.instance()
					var pos = map_to_world(world_to_map(event.position))
					b = posInCenter(event.position, b)
					add_child(b)
				2:
					var b = blockDown.instance()
					var pos = map_to_world(world_to_map(event.position))
					b = posInCenter(event.position, b)
					b.connect("move_down", pacman, "_on_move_down")
					add_child(b)
				3:
					var b = blockLeft.instance()
					var pos = map_to_world(world_to_map(event.position))
					b = posInCenter(event.position, b)
					b.connect("move_left", pacman, "_on_move_left")
					add_child(b)
				4:
					var b = blockRight.instance()
					var pos = map_to_world(world_to_map(event.position))
					b = posInCenter(event.position, b)
					b.connect("move_right", pacman, "_on_move_right")
					add_child(b)
				5: 
					var b = blockUp.instance()
					b = posInCenter(event.position, b)
					b.connect("move_up", pacman, "_on_move_up")
					add_child(b)
					
func posInCenter(initialPosition, b):
	var pos = map_to_world(world_to_map(initialPosition))
	print(get_cellv(pos))
	print(get_cell_autotile_coord(pos.x,pos.y))
	print(tile_set)
	print(tile_set.get_tiles_ids())
	b.position.x = pos.x + 30
	b.position.y = pos.y + 30
	
	b.z_index=0
	
	return b
