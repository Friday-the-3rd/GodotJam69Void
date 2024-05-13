extends StaticBody3D
class_name ItemObject3D

@export var item_resource := preload("res://ItemResources/Placeholder.tres")

func item_name():
	return item_resource.item_name

func item_desc():
	return item_resource.item_desc

func item_mesh():
	for child in get_children():
		if child is MeshInstance3D:
			return child.mesh
	var placeholder : BoxMesh = load("res://Meshes/placeholder.tres").duplicate()
