extends TileMap

onready var gridLines := $GridLines
onready var pacman := $Pacman

export (PackedScene) var blockLeft : PackedScene

var selectedBlock := 0

func _process(delta: float):
	var worldSize = world_to_map(get_viewport().size)
	var quantColumns = worldSize.y - 1
	var quantLines = worldSize.x - 1

#	print(quantLines)

	for l in range(1, quantLines):
		for c in range(1, quantColumns):
			gridLines.set_cellv(Vector2(l, c), 0)

#	gridLines.clear()

	var mouse_position = get_viewport().get_mouse_position()
	var cell := world_to_map(mouse_position)
	var tile_pos = map_to_world(world_to_map(mouse_position))
#	print(cell)
	
	if cell.x > 0 && cell.x < quantLines && cell.y > 0 && cell. y < quantColumns:
		gridLines.set_cellv(cell, selectedBlock)
		
func _input(event):
#	print("EVENTO")
#	print(event)
#	print(event.is_action_pressed("up"))
	
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
		print(event.is_pressed())
		print(event.get_button_index())
		print(event.position)
		
		if event.pressed:
			var b = blockLeft.instance()
			var pos = map_to_world(world_to_map(event.position))
			b.position.x = pos.x + 30
			b.position.y = pos.y + 30
			b.z_index=0
			b.connect("move_up", pacman, "_on_move_up")
			
#			b.position = event.position
			add_child(b)
