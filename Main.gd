extends Node2D

onready var tile = $TileMap
onready var pacman = $KinematicBody2D

export (PackedScene) var LevelSelector : PackedScene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HUD_start_play() -> void:
	get_tree().change_scene_to(LevelSelector)
	pass # Replace with function body.
