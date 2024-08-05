extends Node

var SceneManager
var Gorp
var cauldron_item
var next_scene : PackedScene

func set_next_scene(scene):
	next_scene = scene
	
func get_next_scene() -> PackedScene :
	return next_scene

func _ready():
	SceneManager = get_tree().current_scene.get_node("SceneManager")
	
func refresh_Gorp():
	Gorp = get_tree().current_scene.get_node("LevelScene").get_child(0).get_node("Gorp")
