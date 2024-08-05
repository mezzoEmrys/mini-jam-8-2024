extends Control
@onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("win_cutscene")
	pass # Replace with function body.

func end_cutscene():
	Get.SceneManager.load_scene_named("res://scenes/main_menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
