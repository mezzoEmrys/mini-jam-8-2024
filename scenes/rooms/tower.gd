extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if not Get.SceneManager.catmint_active:
		remove_child($Paw)
	if not Get.SceneManager.ginger_active:
		remove_child($Ghost)
	if not Get.SceneManager.ice_active:
		remove_child($ice)
	if not Get.SceneManager.pepper_active:
		remove_child($pepper)
	if not Get.SceneManager.lemon_active:
		remove_child($lemon)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
