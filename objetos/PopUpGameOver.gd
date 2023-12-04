#extends Control
#
#onready var popUp := $PopUpGameOver
#onready var rect := $ColorRect
#
#func _ready():
#	rect.color = Color(0,0,0,0)
#
#func showPopUp():
#	popUp.popup()
#
#func _on_PopUpGameOver_about_to_show():
#	print("AAAAAAAAAAAAAAAAAAA")
#	rect.color = Color(0,0,0, 255*0.8)
#
#func _on_PopUpGameOver_popup_hide():
#	rect.color = Color(0,0,0,0)
extends PopupDialog

signal restart;

var backScene = load("res://Main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = PAUSE_MODE_PROCESS
#	popup_exclusive = false
	
	pass # Replace with function body.

func _on_btn_home_pressed():
	print("HOME")
	get_tree().change_scene_to(backScene)

func _on_btn_restart_pressed():
	emit_signal("restart")
	print(popup_exclusive)
