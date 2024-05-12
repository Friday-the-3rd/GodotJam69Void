extends PanelContainer

@onready var QWindow : Window = $QuitWindow

func _on_exit_pressed()->void:
	QWindow.popup()


func _on_stay_pressed()->void:
	QWindow.hide()


func _on_quit_pressed()->void:
	get_tree().quit()


func _on_start_pressed():
	TransitionScreen.change_to_new_scene("res://Levels/level_env.tscn")
