extends Node2D

export (PackedScene) var Level1 : PackedScene
export (PackedScene) var Level2 : PackedScene
export (PackedScene) var Level3 : PackedScene
export (PackedScene) var Level4 : PackedScene
export (PackedScene) var Level5 : PackedScene
export (PackedScene) var Level6 : PackedScene
export (PackedScene) var Level7 : PackedScene
export (PackedScene) var Level8 : PackedScene
export (PackedScene) var Level9 : PackedScene
export (PackedScene) var Level10 : PackedScene
#var Level10 = load("res://mapas/Level10.tscn")

var backScene = load("res://Main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_btn_level1_pressed() -> void:
	get_tree().change_scene_to(Level1)
	pass # Replace with function body.
	
func _on_btn_level2_pressed() -> void:
	get_tree().change_scene_to(Level2)
	pass # Replace with function body.
	
func _on_btn_level3_pressed() -> void:
	get_tree().change_scene_to(Level3)
	pass # Replace with function body.
	
func _on_btn_level4_pressed() -> void:
	get_tree().change_scene_to(Level4)
	pass # Replace with function body.

func _on_btn_level5_pressed() -> void:
	get_tree().change_scene_to(Level5)
	pass # Replace with function body.
	
func _on_btn_level6_pressed() -> void:
	get_tree().change_scene_to(Level6)
	pass # Replace with function body.
	
func _on_btn_level7_pressed() -> void:
	get_tree().change_scene_to(Level7)
	pass # Replace with function body.
	
func _on_btn_level8_pressed() -> void:
	get_tree().change_scene_to(Level8)
	pass # Replace with function body.

func _on_btn_level9_pressed() -> void:
	get_tree().change_scene_to(Level9)
	pass # Replace with function body.
	
func _on_btn_level10_pressed() -> void:
	get_tree().change_scene_to(Level10)
	pass # Replace with function body.

#func _on_btn_voltar_pressed():
#	pass # Replace with function body.
#
func _on_btn_back_pressed():
	get_tree().change_scene_to(backScene)
	pass # Replace with function body.
