extends Node3D

func _ready():
	for mesh : MeshInstance3D in $Collidable.get_children():
		mesh.create_convex_collision()
	TransitionScreen.get_node("AnimationPlayer").play("FadeOut")
