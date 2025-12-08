extends CharacterBody2D

const SPEED = 300
var screen_size 

func _ready() -> void:
	screen_size = get_viewport_rect().size - Vector2(0,32)

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("moveup2", "movedown2")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
		
	position = position.clamp(Vector2(0,32), screen_size)

	move_and_slide()
