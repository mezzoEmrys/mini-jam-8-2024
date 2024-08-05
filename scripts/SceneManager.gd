extends Node

var catmint_active : bool = false
var ginger_active : bool = false
var ice_active : bool = false
var lemon_active: bool = false
var pepper_active: bool = false

var tea_active: bool = false
var mug_active: bool = false

var next_scene : PackedScene
var level_container : Node2D
var transition : AnimationPlayer

@onready var base = $"../Music/base"
@onready var fire = $"../Music/fire"
@onready var electricity = $"../Music/electricity"
@onready var ice = $"../Music/ice"
@onready var ghost = $"../Music/ghost"
@onready var jungle = $"../Music/jungle"

func _ready():
	base.play()
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
	
func activate_hazards(item):
	stop_music()
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
			load_scene(load("res://scenes/win_cutscene.tscn"))
	play_music()

func stop_music():
	base.stop()
	fire.stop()
	electricity.stop()
	ice.stop()
	ghost.stop()
	jungle.stop()
	
func play_music():
	base.play()
	if pepper_active:
		fire.play()
	if lemon_active:
		electricity.play()
	if ice_active:
		ice.play()
	if ginger_active:
		ghost.play()
	if catmint_active:
		jungle.play()
	

	

