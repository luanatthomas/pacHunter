extends KinematicBody2D

export (int) var speed = 200

onready var sprite := $AnimatedSprite

var velocity = Vector2()

func _ready() -> void:
	print("!!!!!")
	velocity.y = speed

func get_side_input():
	#velocity.x = 0
	var right = Input.is_action_pressed('right')
	var left = Input.is_action_pressed('left')

	if right:
		inverte_movimento()

func inverte_movimento():
	velocity.x = velocity.x * -1
	velocity.y = velocity.y * -1

func _physics_process(delta):
	get_side_input()

	move_and_slide(velocity, Vector2(0, -1))
	
	print(velocity)


func _on_Bloco_MOVE_UP() -> void:
	print("MOVEU")
