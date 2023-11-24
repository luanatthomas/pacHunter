extends 'res://mapas/Grid.gd'

onready var serra1 := $SerraLinha1
onready var serra2 := $SerraLinha2

func _ready():
	serra1.setPointEnd(Vector2(grid.map_to_world(Vector2(9, 10)).x, 0))
	serra2.setPointEnd(Vector2(grid.map_to_world(Vector2(9, 10)).x, 0))
