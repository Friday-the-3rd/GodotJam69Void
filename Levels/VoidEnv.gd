extends WorldEnvironment

@onready var noise : FastNoiseLite = self.environment.sky.sky_material.panorama.noise

func _physics_process(delta):
	noise.offset.z += 2.5 * delta
	pass
