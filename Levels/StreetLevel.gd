extends LevelMap

func _init():
	DialogueHandler.played.connect(another_dialogue)

func _ready():
	Music.stream = preload("res://Sounds/natura.mp3")
	Music.play()
	super()

func _on_first_dialogue_timeout():
	DialogueHandler.show_text("Me","Wait. [shake]Where am I?[/shake]", 10)


func _on_second_dialogue_timeout():
	$Player/Sprite3D.visible = true
	DialogueHandler.show_text("Person on the phone","[shake]Please, find him, I beg you![/shake]", 11)

func another_dialogue(dialogue):
	if dialogue == 10:
		DialogueHandler.show_text("Me", "Oh, I must have been going to Maggie.\n[wave]It must be right[/wave]")
	if dialogue == 11:
		DialogueHandler.show_text("Policeman", "We are doing everything we can. Please stay calm and wait.",12)
		$Collidable.visible = false
		$Particles.visible = false
	if dialogue == 12:
		DialogueHandler.show_text("Policeman", "Oh my god. There he is, Miss. We found him.",13)
		$Player/car.visible = true
	if dialogue == 13:
		$Player/AnimationPlayer.active = false
		$Player/AnimationPlayer2.play("open")

func _on_animation_player_2_animation_finished(anim_name):
	if anim_name == "open":
		TransitionScreen.change_to_new_scene("res://Levels/VoidEnv.tscn")
