extends WorldEnvironment

func _ready() -> void:
	self.environment.fog_enabled = true
	self.environment.volumetric_fog_enabled = true
