extends Area2D

@onready var gorp = get_tree().current_scene.get_node("Gorp")


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_parent().get_children():
		if child is AnimatedSprite2D:
			child.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(get_overlapping_bodies())
	pass


func _on_body_entered(body):
	if(body.name == "Gorp"):
		gorp.respawn()

