extends Transition

func _init():
	DialogueHandler.played.connect(another_dialogue)
	
func use():
	if AnimPlayer != null:
		AnimPlayer.play("used")
	else:
		_on_animation_tree_animation_finished("None")
	

func _on_animation_tree_animation_finished(_anim_name):
	DialogueHandler.show_text("[rainbow]Honey[/rainbow]","Hey, Sweetheart. Maggie's not living with us anymore.",22)

func another_dialogue(dialogue):
	if dialogue == 22:
		DialogueHandler.show_text("[rainbow]Honey[/rainbow]","[shake]Remember?[/shake]",23)
	if dialogue == 23:
		moved.emit()
