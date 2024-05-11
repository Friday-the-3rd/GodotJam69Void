extends Window



func _on_about_to_popup():
	get_tree().paused = true


func _on_close_requested():
	get_tree().paused = false
