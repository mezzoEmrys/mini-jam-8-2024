extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	if(body.name == "Gorp"):
		var item = get_node("/root/GameSource/Gorp/held_item")
		if item.item_held:
			print("Cauldroning " + item.give_item())
			
			
