extends Node2D

export (PackedScene) var Tutorial1 : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_btn_tutorial1_pressed() -> void:
	get_tree().change_scene_to(Tutorial1)
	pass # Replace with function body.
