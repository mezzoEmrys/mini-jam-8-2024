extends Node2D

var needs_break : bool = false
var break_time : float = 0.2
var break_timer : float = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var sprite : AnimatedSprite2D

func _ready():
	for child in get_children():
		if child is AnimatedSprite2D:
			sprite = child
	sprite.play("default")

func _process(delta):
	if needs_break:
		sprite.play("break")
		break_timer += delta
		if break_timer >= break_time :
			queue_free()

func _physics_process(delta):
	if not needs_break :
		position.y += (gravity * delta)

func destroy_icicle():
	break_timer = 0
	needs_break = true
	for child in get_children():
		if child is Area2D:
			for grandchild in child.get_children():
				if grandchild is CollisionShape2D :
					grandchild.disabled = true

func _on_area_2d_body_entered(body):
	if (body.name == "Gorp") or (body.name == "icicle_1")or (body.name == "icicle_2")or (body.name == "icicle_3"):
		pass
	else:
		call_deferred("destroy_icicle")

