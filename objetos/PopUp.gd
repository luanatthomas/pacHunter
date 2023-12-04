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
