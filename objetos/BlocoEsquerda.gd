extends Area2D

signal move_left(bodyName)

func _on_BlocoEsquerda_body_entered(body):
	emit_signal("move_left", body.name)
