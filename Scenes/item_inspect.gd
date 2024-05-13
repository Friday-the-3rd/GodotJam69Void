extends CanvasLayer

@onready var Camera := $SubViewportContainer/SubViewport/Camera3D
@onready var Item := $SubViewportContainer/SubViewport/Item
@onready var ItemLookAt := $SubViewportContainer/SubViewport/RotationOrigin/ItemLookTo
@onready var RotOr := $SubViewportContainer/SubViewport/RotationOrigin
@onready var ItemPan := $SubViewportContainer/SubViewport/Panel

var lmb_start_pos := Vector2.ZERO
var cur_rotation := Vector3( deg_to_rad(15),0,deg_to_rad(30))

func _ready():
	Item.global_rotation = cur_rotation

func _input(event):
	zoom()
	rotate_inspect()
	check_desc()

func check_desc():
	if Input.is_action_just_pressed("inspect_desc"):
		ItemPan.visible = !ItemPan.visible

func zoom():
	if Input.is_action_just_pressed("zoom_in"):
		Camera.global_position = lerp(Camera.global_position, Vector3(0,0,1),0.2)
	elif Input.is_action_just_pressed("zoom_out"):
		Camera.global_position = lerp(Camera.global_position, Vector3(0,0,4),0.2)

func rotate_inspect():
	if Input.is_action_pressed("item_inspect"):
		if Input.is_action_just_pressed("item_inspect"):
			RotOr.global_rotation = Vector3.ZERO
			cur_rotation = Item.rotation
			lmb_start_pos = get_window().get_mouse_position()
		
		####
		####	Add new node3d far away from origin. Everytime when rotating reset its orientation. Get Objects global_rotation at the same time
		####	Then rotate like below. Rotate object look_at node3d position + initial global rotation
		####
		
		var mouse_delta = lmb_start_pos - (get_window().get_mouse_position())
		RotOr.global_rotation.y = lerp(RotOr.global_rotation.y, clamp(deg_to_rad(mouse_delta.x),-0.95,0.95), 0.2)
		RotOr.global_rotation.x = lerp(RotOr.global_rotation.x, clamp(deg_to_rad(mouse_delta.y),-0.95,0.95), 0.2)
		
		Item.look_at(ItemLookAt.global_position, Vector3.UP, true)
		Item.global_rotation += cur_rotation
