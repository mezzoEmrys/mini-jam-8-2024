extends Node2D

var needs_break : bool = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(_delta):
	if needs_break:
		queue_free()

func _physics_process(delta):
	position.y += (gravity * delta)

func destroy_icicle():
	queue_free()

func _on_area_2d_body_entered(body):
	if (body.name == "Gorp") or (body.name == "icicle_1")or (body.name == "icicle_2")or (body.name == "icicle_3"):
		pass
	else:
		destroy_icicle()

