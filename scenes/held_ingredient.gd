extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func set_item(spr):
	print("item pickup")
	texture = spr
	
	
