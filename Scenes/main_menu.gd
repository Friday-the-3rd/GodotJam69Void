extends PanelContainer

@onready var QWindow : Window = $QuitWindow

func _on_exit_pressed()->void:
	QWindow.popup()


func _on_stay_pressed()->void:
	QWindow.hide()


func _on_quit_pressed()->void:
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_env.tscn")
