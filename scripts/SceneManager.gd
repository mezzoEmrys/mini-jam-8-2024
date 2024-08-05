extends Node

var catmint_active : bool = false
var ginger_active : bool = false
var ice_active : bool = false
var lemon_active: bool = false
var pepper_active: bool = false

var next_scene : PackedScene
var level_container : Node2D
var transition : AnimationPlayer

func _ready():
	pass
	
func load_containers():
	level_container = get_tree().current_scene.get_node("LevelScene")
	transition = get_tree().current_scene.get_node("canvas").get_node("transition_player")

func stage_hidden():
	load_containers()
	for child in level_container.get_children():
		level_container.remove_child(child)
		child.queue_free()
	level_container.add_child(next_scene.instantiate())
	Get.refresh_Gorp()
	transition.play_backwards('dissolve')

func load_scene(scene: PackedScene):
	load_containers()
	transition.play("dissolve")
	next_scene = scene

