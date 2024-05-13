extends CanvasLayer

@onready var Item := $SubViewportContainer/SubViewport/Item
@onready var ItemPan := $SubViewportContainer/SubViewport/Panel

@onready var Camera := $SubViewportContainer/SubViewport/Camera3D

var lmb_start_pos := Vector2.ZERO
var cur_rotation := Vector3( deg_to_rad(15),0,deg_to_rad(30))

const MOUSE_SENS := 0.002

func set_object(object : ItemObject3D):
	Item.mesh = object.item_mesh()
	ItemPan.get_node("Item Name").text = "[center][wave]"+object.item_name()+"[/wave][/center]"
	ItemPan.get_node("Item Desc").text = "[center]"+object.item_desc()+"[/center]"
	lmb_start_pos = Vector2.ZERO
	cur_rotation = Vector3( deg_to_rad(15),0,deg_to_rad(30))

func _ready():
	Item.global_rotation = cur_rotation

func _input(event):
	zoom()
	rotate_inspect(event)
	check_desc()

func check_desc():
	if Input.is_action_just_pressed("inspect_desc"):
		ItemPan.visible = !ItemPan.visible

func zoom():
	if Input.is_action_just_pressed("zoom_in"):
		Camera.global_position = lerp(Camera.global_position, Vector3(0,0,1),0.2)
	elif Input.is_action_just_pressed("zoom_out"):
		Camera.global_position = lerp(Camera.global_position, Vector3(0,0,4),0.2)

func rotate_inspect(event):
	if Input.is_action_pressed("item_inspect"):			
		if event is InputEventMouseMotion:
			Item.rotate_y(-event.relative.x * 4 * MOUSE_SENS)
			Item.rotate_x(-event.relative.y * 4 * MOUSE_SENS)

func _on_visibility_changed():
	if visible:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
