extends KinematicBody2D

export (Vector2) var direction = Vector2(1,0)

onready var sprite := $AnimatedSprite
onready var ray := $RayCast2D
onready var tween := $Tween

var velocity = Vector2()
var tile_size = 60

func _ready() -> void:
	set_name("Pacman")
	velocity = direction/direction.length()
	sprite.play("right")
	z_index=2

func _physics_process(delta):
	
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

	if !ray.is_colliding():
		tween.interpolate_property(self, "position",
		position, position + velocity*tile_size,
		0.4, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
		tween.start()
	else :
		inverte_movimento()

func _on_move_up(bodyName):
#	print("BBBBBB")
	if bodyName == name:
		velocity.x = 0
		velocity.y = -1

func _on_move_right(bodyName):
	if bodyName == name:
		velocity.x = 1
		velocity.y = 0

func _on_move_left(bodyName):
	if bodyName == name:
		velocity.x = -1
		velocity.y = 0


func _on_move_down(bodyName):
	if bodyName == name:
		velocity.x = 0
		velocity.y = 1
