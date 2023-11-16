extends Area2D

export (Vector2) var direction = Vector2(1,0)

onready var sprite := $AnimatedSprite
onready var ray := $RayCast2D
onready var tween := $Tween

var velocity = Vector2()
var tile_size = 60

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	set_name("FatasmaAzul")
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

	var my_random_number = rng.randf_range(0, 1)
	if my_random_number < 0.1:
		var dir = rng.randi_range(0, 3)
		match dir:
			0:
				velocity.x = 0
				velocity.y = -1
			1:
				velocity.x = 0
				velocity.y = 1
			2: 
				velocity.x = -1
				velocity.y = 0
			3:
				velocity.x = 1
				velocity.y = 0

func _on_FantasmaAzul_body_entered(body: Node) -> void:
	if body.name == "Pacman":
		queue_free()
