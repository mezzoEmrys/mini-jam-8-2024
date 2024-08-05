extends Node

var SceneManager
var Gorp

func _ready():
	SceneManager = get_tree().current_scene.get_node("SceneManager")
	
func refresh_Gorp():
	Gorp = get_tree().current_scene.get_node("Gorp")
