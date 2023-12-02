extends Node2D

export (PackedScene) var Tutorial1 : PackedScene
export (PackedScene) var Tutorial2 : PackedScene
export (PackedScene) var Tutorial3 : PackedScene


var backScene = load("res://Main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_btn_tutorial1_pressed() -> void:
	get_tree().change_scene_to(Tutorial1)
	pass # Replace with function body.

func _on_btn_tutorial2_pressed():
	pass # Replace with function body.

func _on_btn_tutorial3_pressed():
	get_tree().change_scene_to(Tutorial3)
	pass # Replace with function body.

#func _on_btn_voltar_pressed():
#	pass # Replace with function body.
#
func _on_btn_back_pressed():
	get_tree().change_scene_to(backScene)
	pass # Replace with function body.
