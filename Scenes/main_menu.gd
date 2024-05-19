extends PanelContainer

@onready var QWindow : Window = $QuitWindow
var mmmusic = preload("res://Sounds/untitled.mp3")

func _ready():
	TransitionScreen.get_node("AnimationPlayer").play("FadeOut")
	if !Music.playing or Music.stream != mmmusic:
		Music.stream = mmmusic
		Music.play()

func _on_exit_pressed()->void:
	QWindow.popup()


func _on_stay_pressed()->void:
	QWindow.hide()


func _on_quit_pressed()->void:
	get_tree().quit()


func _on_start_pressed():
	TransitionScreen.change_to_new_scene("res://Levels/HospitalEnv.tscn")


func _on_credits_pressed():
	TransitionScreen.change_to_new_scene("res://Scenes/credits.tscn")
