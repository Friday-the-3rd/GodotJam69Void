extends LevelMap

func _ready():
	Music.stop()
	$human1/AnimPlayer.play("lay_down")
	super()

func _on_anim_player_animation_finished(anim_name):
	$Objects/door/AnimPlayer.play("close")


func _on_timer_timeout():
	DialogueHandler.show_text("Me","Where am I?\n[shake]I'm scared[/shake]")
