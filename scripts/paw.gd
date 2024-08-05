extends Node2D

@export var swipe_delay : float = 8
var timer : float = 0
var is_swiping : bool = false
@onready var anim = $AnimationPlayer
@onready var gorp = get_tree().current_scene.get_node("Gorp")
@onready var hazard = $Hazard

func swipe_finished():
	is_swiping = false

# Called when the node enters the scene tree for the first time.
func _ready():
	hazard.hide()
	anim.play("RESET")

func _process(delta):
	timer += delta
	if timer >= swipe_delay:
		is_swiping = true
		anim.play("swiping")
	pass
	
func _physics_process(_delta):
	if not is_swiping:
		position = gorp.position
		pass
	pass
