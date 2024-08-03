extends CharacterBody2D


@export var speed : float = 300.0
@export var jump_force : float = -250.0
@export var jump_time : float = 0.25
@export var coyote_time : float = 0.075
@export var gravity_multiplier : float = 3.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jumping : bool = false
var jump_timer : float = 0
var coyote_timer : float = 0
@onready var sprite_2d = $GorpSprite

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and not is_jumping:
		velocity.y += gravity * delta
		coyote_timer += delta
	else:
		coyote_timer = 0

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyote_timer < coyote_time):
		velocity.y = jump_force
		is_jumping = true
	elif Input.is_action_pressed("jump") and is_jumping:
		velocity.y = jump_force
	
	if is_jumping and Input.is_action_pressed("jump") and jump_timer < jump_time:
		jump_timer += delta
	else:
		#TODO: These two lines of code make the character drop immediately after input release
		#if (velocity.y < -100):
			#velocity.y = -100
		is_jumping = false
		jump_timer = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")

	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if direction != 0:
		sprite_2d.flip_h = direction < 0
	move_and_slide()
