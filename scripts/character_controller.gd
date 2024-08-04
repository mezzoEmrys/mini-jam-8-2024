extends CharacterBody2D

@export var speed : float = 300.0
@export var jump_impulse : float = -400.0
@export var jump_sustain : float = -0.5
@export var jump_time : float = 0.2
@export var coyote_time : float = 0.075
@export var gravity_multiplier : float = 3.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jumping : bool = false
var jump_timer : float = 0
var coyote_timer : float = 0
var was_airborne : bool = false
var hitstun : bool = false

@onready var item_sprite = $held_item
@onready var item_held = false
@onready var item = ""

var is_charging : bool = false
@onready var sprite_2d = $AnimatedSprite2D
@onready var anim_player = $AnimationPlayer
var checkpoint = Vector2(250, 250)
var direction = 1

func finish_charge():
	is_charging = false

#func _ready() -> void():
	#connect("item_pickup", self, "")

func _physics_process(delta):
	if hitstun : return
	# Add the gravity.
	var is_airborne = false
	if not is_jumping:
		if not is_on_floor() :
			velocity.y += gravity * delta
			coyote_timer += delta
		elif is_on_floor():
			coyote_timer = 0
			jump_timer = 0
	
	if is_on_floor() or (coyote_timer < coyote_time) :
		if Input.is_action_just_pressed("jump") :
			is_charging = true
			is_jumping = true
			coyote_timer = coyote_time
		if is_jumping and not is_charging :
			velocity.y += jump_impulse
	elif is_jumping:
		if Input.is_action_pressed("jump") and jump_timer < jump_time:
			velocity.y += jump_sustain
			jump_timer += delta
		else :
			is_jumping = false
			
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")

	if direction != 0 and not is_charging:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
			

	if direction != 0:
		sprite_2d.flip_h = direction < 0
	move_and_slide()
	
	if is_on_floor() :
		is_airborne = false
	else :
		is_airborne = true

	if is_jumping :
		anim_player.play("jumping")
	elif is_on_floor() :
		if was_airborne != is_airborne :
			anim_player.play("landing")
		elif velocity.x == 0 :
			anim_player.play("idle")
		else :
			anim_player.play("walking")
	elif not is_jumping : 
		anim_player.play("falling")
		
	was_airborne = is_airborne

func respawn():
	hitstun = true
	anim_player.play("injured")

func animate_return():
	position = checkpoint
	hitstun = false
	
func has_item():
	return item_held
	
func set_checkpoint(body):
	checkpoint = body.position
