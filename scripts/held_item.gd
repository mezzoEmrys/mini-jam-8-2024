extends Node2D

var time = 0
var default_pos = Vector2(0, -500)
var frequency = 3
var amplitude = 50
var item_held = false
var item_id = ""
@onready var animator = $AnimationPlayer
@onready var sound = $AudioStreamPlayer2D

func _ready():
	if Get.item_id != null :
		set_item(Get.item_id, false)
	else :
		hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta * frequency
	set_position(default_pos + Vector2(0, sin(time) * amplitude))

func give_item():
	item_held = false
	Get.item_id = null
	hide()
	return item_id
	
func set_item(id, playsound):
	show()
	print("setting item to " + id)
	item_held = true
	item_id = id
	Get.item_id = id
	if playsound:
		sound.play()
	match id:
		"catmint":
			animator.play("catmint")
		"lemon":
			animator.play("lemon")
		"pepper":
			animator.play("pepper")
		"tea":
			animator.play("tea")
		"ginger":
			animator.play("ginger")
		"ice":
			animator.play("ice")
		"mug":
			animator.play("mug")

