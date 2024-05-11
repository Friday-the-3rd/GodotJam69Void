extends CanvasLayer

var path_to_file : String

func change_to_new_scene(path : String) -> void:
	get_tree().paused = true
	path_to_file = path
	visible = true
	$AnimationPlayer.play("FadeIn")


func _on_animation_finished(name):
	if name == "FadeIn":
		if path_to_file != null:
			get_tree().change_scene_to_file(path_to_file)
	elif name == "FadeOut":
		get_tree().paused = false
		visible = false
