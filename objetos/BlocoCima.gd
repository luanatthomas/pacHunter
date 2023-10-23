extends "res://objetos/Blocks.gd"

signal move_up(bodyName)

func _on_Bloco_body_entered(body: Node) -> void:
	emit_signal("move_up", body.name)


