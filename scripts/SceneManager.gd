extends Node

var catmint_active : bool = false
var ginger_active : bool = false
var ice_active : bool = false
var lemon_active: bool = false
var pepper_active: bool = false

var tea_active: bool = false
var mug_active: bool = false

var from : String
var level_container : Node2D
var transition : AnimationPlayer

func _ready():
	pass
	
func load_containers():
	level_container = get_tree().current_scene.get_node("LevelScene")
	transition = get_tree().current_scene.get_node("canvas").get_node("transition_player")

func stage_hidden():
	var next = Get.get_next_scene()
	var scene = next.instantiate()
	load_containers()
	for child in level_container.get_children():
		level_container.remove_child(child)
		child.queue_free()
	level_container.add_child(scene)
	Get.refresh_Gorp()
	transition.play_backwards('dissolve')

func load_scene_named(scene: String):
	print(scene)
	var out = load(scene)
	load_scene(out)

func load_scene(scene: PackedScene):
	from = get_tree().current_scene.get_node("LevelScene").get_child(0).name
	load_containers()
	Get.set_next_scene(scene)
	transition.play("dissolve")
	
func activate_hazards(item):
	match item:
		"catmint":
			catmint_active = true
		"lemon":
			lemon_active = true
		"ginger":
			ginger_active = true
		"pepper":
			pepper_active = true
		"ice":
			ice_active = true
		"tea":
			tea_active = true
		"mug":
			mug_active = true

