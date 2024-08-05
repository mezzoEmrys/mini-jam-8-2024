extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Get.SceneManager.tea_active:
		remove_child($TeaLeaf)
		if Get.SceneManager.catmint_active:
			remove_child($CatmintBerry)
		if Get.SceneManager.ginger_active:
			remove_child($HauntedGinger)
		if Get.SceneManager.ice_active:
			remove_child($"Tail-cicle")
		if Get.SceneManager.pepper_active:
			remove_child($HotPepper)
		if Get.SceneManager.lemon_active:
			remove_child($LemonBattery)
		if not (Get.SceneManager.lemon_active and Get.SceneManager.pepper_active and  Get.SceneManager.ice_active and  Get.SceneManager.ginger_active and Get.SceneManager.catmint_active):
			remove_child($Mug)
	else:
		remove_child($CatmintBerry)
		remove_child($HauntedGinger)
		remove_child($"Tail-cicle")
		remove_child($HotPepper)
		remove_child($LemonBattery)
		remove_child($Mug)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
