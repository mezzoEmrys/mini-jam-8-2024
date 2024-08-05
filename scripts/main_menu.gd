extends Control

var main_room = preload("res://scenes/rooms/main_room.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("jump"):
		_on_button_start_pressed()


func _on_button_start_pressed():
	Get.SceneManager.load_scene(main_room)

func _on_button_instructions_pressed():
	Get.SceneManager.load_scene(main_room)

func _on_button_credits_pressed():
	Get.SceneManager.load_scene(main_room)
