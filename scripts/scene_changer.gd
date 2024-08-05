extends Node2D

@export_file("*.tscn") var target_scene: String

func disable():
	$Area2D/CollisionShape2D.disabled = true

func _on_area_2d_body_entered(body):
	Get.SceneManager.load_scene_named(target_scene)
