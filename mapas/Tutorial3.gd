extends 'res://mapas/Grid.gd'

onready var serra1 := $SerraLinha1
onready var serra2 := $SerraLinha2
onready var serra3 := $SerraLinha3

func _ready():
	serra1.setPointEnd(grid.map_to_world(Vector2(0,7)))
	serra2.setPointEnd(grid.map_to_world(Vector2(0, -7)))
	serra3.setPointEnd(grid.map_to_world(Vector2(0, 7)))
