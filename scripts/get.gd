extends Node

var SceneManager

func _ready():
	SceneManager = get_tree().current_scene.get_node("SceneManager")
