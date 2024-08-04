extends Area2D

@onready var spr = $Sprite2D
@onready var id = name


var time = 0
var default_pos;
var frequency = 2
var amplitude = 7
var initialized = false

func _ready():
	default_pos = get_position()
	initialized = true
	
	#print(id, default_pos.x)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta * frequency
	if initialized:
		set_position(default_pos + Vector2(0, sin(time) * amplitude))


func _on_body_entered(body):
	if(body.name == "Gorp"):
		var held_item = get_node("/root/GameSource/Gorp/held_item")
		if not held_item.item_held:
			held_item.set_item(id)
			queue_free()
