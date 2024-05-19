extends StaticBody3D
class_name Transition

@export_file() var path_to_next_scene : String = "res://Levels/Level0.tscn"
@export var locked := false

@onready var AnimPlayer := $AnimationPlayer

signal moved

func use():
	if AnimPlayer != null:
		AnimPlayer.play("used")
	else:
		_on_animation_tree_animation_finished("None")
	

func _on_animation_tree_animation_finished(_anim_name):
	moved.emit()
