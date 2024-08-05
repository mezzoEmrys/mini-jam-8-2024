extends Control
@onready var anim = $AnimationPlayer
@onready var smoke = $AnimatedSprite2D2

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("soup_cutscene")
	pass # Replace with function body.

func end_cutscene():
	Get.SceneManager.load_scene(load("res://scenes/rooms/main_room.tscn"))

func play_smoke():
	smoke.play(Get.cauldron_item)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
