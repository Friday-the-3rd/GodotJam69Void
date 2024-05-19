extends CanvasLayer

@onready var Person := $Panel/PersonName
@onready var Text := $Panel/PersonText
@onready var Waiter := $Waiter
@onready var AnimPlayer := $Panel/AnimationPlayer

var text_id = ""

signal played
func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		hide_it()

func hide_it():
	hide()
	Waiter.stop()
	AnimPlayer.stop()
	Text.text = ""
	Person.text = ""

func show_text(speaker, text, id = -1):
	hide_it()
	Person.text = "[center]"+str(speaker)+"[/center]"
	Text.text = "[center]"+str(text)+"[/center]"
	text_id = id
	show()
	AnimPlayer.play("speaking")


func _on_animation_player_animation_finished(anim_name):
	Waiter.start()

func _on_waiter_timeout():
	hide()
	emit_signal("played", text_id)
