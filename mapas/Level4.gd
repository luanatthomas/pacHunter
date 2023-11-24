extends 'res://mapas/Grid.gd'

onready var serra := $SerraLinha

func _ready():
	serra.setPointInit(Vector2(0, 0))
	serra.setPointEnd(Vector2(grid.map_to_world(Vector2(15, 10)).x - grid.map_to_world(Vector2(10,10)).x, 0 ))
