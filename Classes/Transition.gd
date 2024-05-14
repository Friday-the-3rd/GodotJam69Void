extends StaticBody3D
class_name Transition

@export_file() var path_to_next_scene : String = "res://Levels/Level0.tscn"
@export var locked := false

signal door_opened

func use():
	$AnimationTree.active = true

func _on_animation_tree_animation_finished(anim_name):
	$AnimationPlayer.active = false
	door_opened.emit()
