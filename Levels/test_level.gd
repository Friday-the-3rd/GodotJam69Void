extends Node3D
class_name LevelMap

@export var player : Player

func _ready():
	for mesh : MeshInstance3D in $Collidable.get_children():
		mesh.create_convex_collision()
	TransitionScreen.get_node("AnimationPlayer").play("FadeOut")
