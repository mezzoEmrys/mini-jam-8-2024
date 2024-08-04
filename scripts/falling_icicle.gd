extends Node2D

var needs_break : bool = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass 

func _process(_delta):
	if needs_break:
		queue_free()

func _physics_process(delta):
	position.y += (gravity * delta)
