extends RigidBody2D

var screen_size : Vector2
const START_SPEED = 300
const ACCELERATION = 50
var speed : int
var direction : Vector2

func _ready() -> void:
	screen_size = get_viewport_rect().size - Vector2(0,32)
	hide()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction*speed*delta)
	
	if collision:
		$SFX.playing = true
		var collider = collision.get_collider()
		if collider == $"../PLayer1" or $"../PLayer2": #or player 2 paddle
			speed+=ACCELERATION
		
		direction = direction.bounce(collision.get_normal())

func spawn_ball():
	position = Vector2(screen_size.x/2,screen_size.y/2)
	speed = START_SPEED
	direction = set_direction()
	show()

func set_direction() -> Vector2:
	var new_direction: Vector2
	new_direction.x = [1,-1].pick_random()
	new_direction.y = randf_range(-1,1)
	return new_direction.normalized()
