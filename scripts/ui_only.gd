extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("jump"):
		_on_button_pressed()

func _on_button_pressed():
	Get.SceneManager.load_scene_named("res://scenes/main_menu.tscn")
