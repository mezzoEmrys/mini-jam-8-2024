extends Area2D

@onready var spr = $Sprite2D

var time = 0
var default_pos = Vector2(0, 0)
var frequency = 2
var amplitude = 7

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta * frequency
	set_position(default_pos + Vector2(0, sin(time) * amplitude))
	
func _on_body_entered(body):
	print(body.name)
	print(body.get_script())
	print(get_node("/root/GameSource/Gorp"))
	if body.name == 'Gorp':
		print("Gorp")
		queue_free()
