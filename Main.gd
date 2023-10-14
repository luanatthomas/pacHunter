extends Node2D

onready var tile = $TileMap
onready var pacman = $KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func teste():
	print("aAAAAAA------------------")
	var pos = tile.local_to_map(pacman.global_position)
	print(pos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
