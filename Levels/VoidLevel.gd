extends LevelMap


func _on_timer_timeout():
	DialogueHandler.show_text("Me","[shake]I remember now...[/shake]")


func _on_timer_2_timeout():
	DialogueHandler.show_text("Me","I wish I could say one last goodbye...")


func _on_timer_3_timeout():
	DialogueHandler.show_text("Me","[wave]If only I could see them one last time.[/wave]")


func _on_timer_4_timeout():
	TransitionScreen.change_to_new_scene("res://Levels/HospitalEndingEnv.tscn")
