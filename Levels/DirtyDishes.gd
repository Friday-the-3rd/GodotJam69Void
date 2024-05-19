extends StaticBody3D

func _ready():
	TransitionScreen.faded.connect(change)

func use_it():
	TransitionScreen.fade()

func change():
	get_parent().get_node("CleanDishes").visible = true
	get_parent().get_node("Doors/NextDoor").locked = false
	visible = false
	get_parent().get_node("Dishes").start()
