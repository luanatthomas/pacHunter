extends 'Grid.gd'


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var position = grid.map_to_world(Vector2(10, 10))
	pacman.position.x = position.x + 30
	pacman.position.y = position.y + 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
