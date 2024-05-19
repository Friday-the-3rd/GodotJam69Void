extends PanelContainer

var mmmusic = preload("res://Sounds/strings.mp3")

func _ready():
	TransitionScreen.get_node("AnimationPlayer").play("FadeOut")
	Music.stream = mmmusic
	Music.play()

func _on_back_pressed():
	TransitionScreen.change_to_new_scene("res://Scenes/credits.tscn")
