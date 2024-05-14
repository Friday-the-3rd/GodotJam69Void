extends StaticBody3D
class_name Transition

@export_file() var path_to_next_scene : String = "res://Levels/Level0.tscn"
@export var locked := false

@onready var AnimTree := $AnimationTree

signal door_opened

func use():
	AnimTree["parameters/conditions/is_opened"] = true
	

func _on_animation_tree_animation_finished(_anim_name):
	AnimTree["parameters/conditions/is_opened"] = false
	door_opened.emit()
