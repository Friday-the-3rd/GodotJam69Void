extends LevelMap

func _ready():
	Music.stop()
	super()


func _init():
	DialogueHandler.played.connect(another_dialogue)
	
	
func _on_area_3d_body_entered(body):
	if body == $Player:
		DialogueHandler.show_text("Me","Whatever will happen to me.",1)

func another_dialogue(dialogue):
	if dialogue == 1:
		DialogueHandler.show_text("Me","I know, we will find each other eventually.",2)
	if dialogue == 2:
		DialogueHandler.show_text("Me","[shake]And I will miss you too.\nI'll never forget you all.[/shake]",4)
	if dialogue == 4:
		TransitionScreen.change_to_new_scene("res://Scenes/the end.tscn")
