extends "res://objetos/Blocks.gd"

signal move_down(bodyName)

func _on_BlocoBaixo_body_entered(body):
	emit_signal("move_down", body.name)
