extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Get.SceneManager.from)
	if Get.SceneManager.from == "Tower":
		$Gorp.position = get_node("Entry").position
	if Get.SceneManager.from == "soup_cutscene":
		$Control/AnimationPlayer.play(Get.cauldron_item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
