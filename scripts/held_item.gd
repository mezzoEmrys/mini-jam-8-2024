extends Node2D

var time = 0
var default_pos = Vector2(0, -500)
var frequency = 3
var amplitude = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta * frequency
	set_position(default_pos + Vector2(0, sin(time) * amplitude))
