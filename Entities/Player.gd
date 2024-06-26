extends CharacterBody3D
class_name Player

######
### Constants
######
const SPEED := 5.0
#const JUMP_VELOCITY := 4.5
const MOUSE_SENS := 0.002

######
### Variables
######
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var target_pos := Vector3.ZERO

######
### Onready
######
@onready var Pivot := $Neck
@onready var PlayerCam := $Neck/Eyes
@onready var QWindow := $QuitWindow
@onready var Ray := $Neck/Ray
@onready var Feet := $Feet
@onready var AnimTree := $AnimationTree

var item_inspect = preload("res://Scenes/item_inspect.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	PlayerCam.make_current()

func _physics_process(delta):
	movement(delta)

func _input(_event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		ray_collision_use()
	
func ray_collision_use():
	if Ray.get_collider() != null:
		var collider = Ray.get_collider()
		if collider is Transition:
			if !collider.locked:
				collider.connect("moved",TransitionScreen.change_to_new_scene.bind(collider.path_to_next_scene))
			collider.use()
		if collider is ItemObject3D:
			IInspect.visible = true
			IInspect.set_object(collider)
		if collider.is_in_group("dishes"):
			collider.use_it()
	
func _unhandled_input(event):
	look_around(event)
	if Input.is_action_just_pressed("ui_cancel"):
		if IInspect.visible:
			IInspect.visible = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			QWindow.popup()
	
func movement(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	var input_dir = Input.get_vector("strafe_left", "strafe_right", "walk_forward", "walk_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		if Feet.get_collider():
			var floor = Feet.get_collider()
			if floor is Floor:
				pass
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	AnimTree.set("parameters/movement_dir/blend_position", Vector2(direction.x, -direction.z))
	AnimTree.set("parameters/is_walking/blend_amount", !(velocity.x != 0 or velocity.z != 0))
	
	move_and_slide()
	
func look_around(event):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and event is InputEventMouseMotion:
		rotate_y(-event.relative.x * MOUSE_SENS)
		Pivot.rotate_x(-event.relative.y * MOUSE_SENS)
		Pivot.rotation.x = clamp(Pivot.rotation.x, -1.3, 1.3)

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_stay_pressed():
	QWindow.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
