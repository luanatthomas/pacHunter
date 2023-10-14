extends KinematicBody2D

export (int) var speed = 1

onready var sprite := $AnimatedSprite
onready var ray := $RayCast2D
onready var tween := $Tween

var velocity = Vector2()
var tile_size = 60

func _ready() -> void:
	set_name("Pacman")
	velocity.x = speed
	sprite.play("right")

func _physics_process(delta):
#	ray.set_cast_to(Vector2.RIGHT)
#	ray.force_raycast_update()
#	print(ray)
##	print(ray.get_collision_normal())
#	print(ray.get_collision_point())
	
	if !tween.is_active():
		update_sprite()
		move()

func inverte_movimento():
	velocity.x = velocity.x * -1
	velocity.y = velocity.y * -1

func update_sprite():
	if velocity.x > 0:
		sprite.play("right")
	elif velocity.x < 0:
		sprite.play("left")
	elif velocity.y < 0:
		sprite.play("up")
	else:
		sprite.play("down")

func move():
	ray.set_cast_to(velocity * tile_size)
	ray.force_raycast_update()
	print(ray)
	print(ray.get_collision_normal())
	print(ray.get_collision_point())

	if !ray.is_colliding():
		tween.interpolate_property(self, "position",
		position, position + velocity*tile_size,
		0.4, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
		tween.start()
	else :
		inverte_movimento()

func _on_move_up(bodyName):
	if bodyName == name:
		velocity.x = 0
		velocity.y = speed * -1

func _on_move_right(bodyName):
	if bodyName == name:
		velocity.x = speed
		velocity.y = 0

func _on_move_left(bodyName):
	if bodyName == name:
		velocity.x = speed * -1
		velocity.y = 0


func _on_move_down(bodyName):
	if bodyName == name:
		velocity.x = 0
		velocity.y = speed
