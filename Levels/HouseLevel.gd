extends LevelMap

func _init():
	DialogueHandler.played.connect(another_dialogue)
	
func _ready():
	Music.stream = preload("res://Sounds/natura.mp3")
	Music.play()
	super()


func _on_dishes_timeout():
	DialogueHandler.show_text("[rainbow]Honey[/rainbow]", "Sweetheart! Why won't you go see Maggie?",0)

func another_dialogue(dialogue):
	if dialogue == 0:
		DialogueHandler.show_text("Me", "Sure, my dear!",1)
	if dialogue == 1:
		DialogueHandler.show_text("Me", "[wave]I better go now... was she upstairs, maybe?[/wave]")
	if dialogue == 10:
		DialogueHandler.show_text("[rainbow]Honey[/rainbow]","Oh, you're back? Could you wash the dishes for me please?")


func _on_first_dialogue_timeout():
	DialogueHandler.show_text("Me","Oh. [wave]My house...[/wave]\nI missed this place",10)
