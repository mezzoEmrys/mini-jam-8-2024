extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if not (Get.SceneManager.catmint_active and Get.SceneManager.ginger_active and Get.SceneManager.ice_active and Get.SceneManager.pepper_active and Get.SceneManager.lemon_active and Get.SceneManager.tea_active) :
		$SceneChanger7.disable()
	
	if Get.SceneManager.from != "MainRoom":
		$Gorp.position = get_node("Entry").get_node(Get.SceneManager.from).position
	
	if not Get.SceneManager.catmint_active:
		remove_child($Paw)
	else:
		remove_child($catmint_icon)
		
	if not Get.SceneManager.ginger_active:
		remove_child($Ghost)
	else:
		remove_child($ginger_icon)
		
	if not Get.SceneManager.ice_active:
		remove_child($ice)
	else:
		remove_child($ice_icon)
		
	if not Get.SceneManager.pepper_active:
		remove_child($pepper)
	else:
		remove_child($pepper_icon)
		
	if not Get.SceneManager.lemon_active:
		remove_child($lemon)
	else:
		remove_child($lemon_icon)
	
	if Get.SceneManager.tea_active:
		remove_child($tea_icon)

	if Get.SceneManager.mug_active:
		remove_child($mug_icon)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
