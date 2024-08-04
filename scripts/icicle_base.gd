extends Node

@export var delay : float = 3
var step_timer : float = 0
@export var icicle : PackedScene

func drop_icicle():
	var child = icicle.instantiate()
	get_parent().add_child(child)

func _process(delta):
	step_timer += delta
	if (step_timer >= delay):
		step_timer = 0
		drop_icicle()
