extends WorldEnvironment

@onready var noise : FastNoiseLite = self.environment.sky.sky_material.panorama.noise

func _physics_process(delta):
	noise.offset.z += 2.5 * delta
	pass

func _ready():
	Music.stream = preload("res://Sounds/Void.mp3")
	Music.play()
