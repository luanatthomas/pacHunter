extends Area2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
signal MOVE_UP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Bloco_body_entered(body: Node) -> void:
	print(body.get_position_in_parent())
	print("ENTROU")
	emit_signal("MOVE_UP")


func _on_BlocoUp_body_exited(body: Node) -> void:
	print("SAIU!!!")
	pass # Replace with function body.
