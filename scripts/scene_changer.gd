extends Node2D

@export var target_scene : PackedScene

func _on_area_2d_body_entered(body):
	Get.SceneManager.load_scene(target_scene)
