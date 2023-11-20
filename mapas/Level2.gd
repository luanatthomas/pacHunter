extends 'Grid.gd'

onready var serra := $Serra

func _ready():
	
	serra.setPointInit(Vector2(0, 0))
	serra.setPointEnd(Vector2(0, grid.map_to_world(Vector2(12,4)).y - grid.map_to_world(Vector2(12,10)).y))
