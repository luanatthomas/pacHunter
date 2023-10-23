extends Area2D

signal move_up(bodyName)

func _ready():
	print("ESQUERDA")

func _on_Bloco_body_entered(body: Node) -> void:
	print("AAAAAAAAAAA")
	emit_signal("move_up", body.name)
