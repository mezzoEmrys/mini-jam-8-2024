extends Area2D

@onready var anim = $AnimationPlayer
var is_chasing : bool = false
var is_awake : bool = false

func do_hide():
	anim.play("hide")
	is_awake = false
	
func do_wake():
	anim.play("wake")
	is_awake = true

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("RESET") # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
