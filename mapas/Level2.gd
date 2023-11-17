extends 'Grid.gd'

# Called when the node enters the scene tree for the first time.
func _ready():
	var position = grid.map_to_world(Vector2(928, 864))
	pacman.position.x = position.x
	pacman.position.y = position.y
