extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
signal start_play;
signal tutorial_play;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_StartButton_pressed() -> void:
	emit_signal("start_play")


func _on_TutorialButton_pressed() -> void:
	emit_signal("tutorial_play")
	
