extends Node2D

@export var swipe_delay : float = 8
var timer : float = 0
var is_swiping : bool = false
@onready var anim = $AnimationPlayer
@onready var hazard = $Hazard
@onready var sound = $AudioStreamPlayer2D

func swipe_finished():
	is_swiping = false
	timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("RESET")

func _process(delta):
	timer += delta
	if timer >= swipe_delay:
		is_swiping = true
		anim.play("swiping")
	
func _physics_process(_delta):
	if not is_swiping:
		position = Get.Gorp.position
		
func meow():
	sound.play()
