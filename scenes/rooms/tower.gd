extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Get.SceneManager.from != "MainRoom":
		$Gorp.position = get_node("Entry").get_node(Get.SceneManager.from).position
	
	if not Get.SceneManager.catmint_active:
		remove_child($Paw)
	else:
		remove_child($catmint-icon)
	if not Get.SceneManager.ginger_active:
		remove_child($Ghost)
	else:
		remove_child($ginger-icon)
	if not Get.SceneManager.ice_active:
		remove_child($ice)
	else:
		remove_child($ice-icon)
	if not Get.SceneManager.pepper_active:
		remove_child($pepper)
	else:
		remove_child($pepper-icon)
	if not Get.SceneManager.lemon_active:
		remove_child($lemon)
	else:
		remove_child($lemon-icon)
	
	if Get.SceneManager.tea_active:
		remove_child($tea-icon)

	if Get.SceneManager.mug_active:
		remove_child($mug-icon)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
