extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	if(body.name == "Gorp"):
		var item = body.get_node("held_item")
		if item.item_held:
			var item_name = item.give_item()
			print("Cauldroning " + item_name)
			Get.cauldron_item = item_name
			print(Get.cauldron_item)
			Get.SceneManager.activate_hazards(item_name)
			if item_name != "mug":
				Get.SceneManager.load_scene_named("res://scenes/soup_cutscene.tscn")
			
			
