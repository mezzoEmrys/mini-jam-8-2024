extends Node2D

@onready var anim = $AnimationPlayer
@onready var animspr = $AnimatedSprite2D


@export var sneeze_timer_max : float = 20.0
var sneeze_timer = 20.0
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	sneeze_timer -= _delta * randf_range(1.0, 3.0)
	if (sneeze_timer < 0):
		anim.play("sneeze")
	pass
