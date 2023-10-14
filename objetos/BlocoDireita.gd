extends Area2D

signal move_right(bodyName)

func _on_BlocoDireita_body_entered(body):
	emit_signal("move_right", body.name)
