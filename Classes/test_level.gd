extends Node3D
class_name LevelMap

func _ready():
	TransitionScreen.get_node("AnimationPlayer").play("FadeOut")
	for mesh : MeshInstance3D in $Collidable.get_children():
		mesh.create_convex_collision()
