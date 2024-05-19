extends CanvasLayer

@export var path_to_file : String = "res://Scenes/main_menu.tscn"
var transition = false

signal faded

func _ready():
	$AnimationPlayer2.play("rotate")

func change_to_new_scene(path : String) -> void:
	DialogueHandler.hide_it()
	transition = true
	get_tree().paused = true
	path_to_file = path
	visible = true
	$AnimationPlayer.play("FadeIn")


func _on_animation_finished(anim_name):
	if anim_name == "FadeIn":
		if transition and path_to_file != null:
			get_tree().change_scene_to_file(path_to_file)
		else:
			faded.emit()
	elif anim_name == "FadeOut":
		if transition:
			get_tree().paused = false
			visible = false

func fade():
	DialogueHandler.hide_it()
	transition = false
	$AnimationPlayer.play("FadeIn")
	$Timer.start()


func _on_timer_timeout():
	transition = false
	$AnimationPlayer.play("FadeOut")
