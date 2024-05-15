extends StaticBody3D
class_name Transition

@export_file() var path_to_next_scene : String = "res://Levels/Level0.tscn"
@export var locked := false

@onready var AnimPlayer := $AnimationPlayer

signal door_opened

func use():
	AnimPlayer.play("open")
	

func _on_animation_tree_animation_finished(_anim_name):
	door_opened.emit()
