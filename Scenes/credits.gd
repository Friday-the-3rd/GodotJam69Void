extends PanelContainer


func _ready():
	TransitionScreen.get_node("AnimationPlayer").play("FadeOut")


func _on_back_pressed():
	TransitionScreen.change_to_new_scene("res://Scenes/credits.tscn")
