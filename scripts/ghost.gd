extends Area2D

@onready var anim = $AnimationPlayer
@onready var spr = $AnimatedSprite2D
var is_chasing : bool = false
var is_awake : bool = false
var is_flying : bool = false
@export var speed : float = 600
@onready var attackchirp = $attackchirp
@onready var hidechirp = $hidechirp

@onready var gorp = $"../Gorp"

func activate():
	$CollisionShape2D.disabled = false
	
func deactivate():
	$CollisionShape2D.disabled = true

func start_flying():
	is_flying = true
	
func end_flying():
	is_flying = false

func do_hide():
	hidechirp.play()
	anim.play("hide")
	is_awake = false
	end_flying()
	
func do_wake():
	attackchirp.play()
	anim.play("wake")
	is_awake = true

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("RESET") # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var facing = 1
	if (gorp.sprite_2d.flip_h):
		facing = -1

	if (gorp.position.x > position.x):
		spr.flip_h = true
	else:
		spr.flip_h = false
	
	if (facing != ((gorp.position.x - position.x)/(abs(gorp.position.x - position.x)))):
		if is_awake:
			do_hide()
	else:
		if not is_awake:
			do_wake()
	if is_flying:
		var gorp_pos = gorp.position
		var target_pos = (gorp_pos - position).normalized()
		#position += (position - gorp.position)
		if position.distance_to(gorp_pos) > 1:
			position += (position * target_pos).normalized()

func _on_body_entered(body):
	if(body.name == "Gorp"):
		gorp.respawn()
	


