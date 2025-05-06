class_name AnomalyParticle extends GPUParticles2D

@onready var anomaly_glitch: Sprite2D = $anomaly_glitch

func glitch(duration:float):
	anomaly_glitch.visible = true
	await get_tree().create_timer(duration).timeout
	anomaly_glitch.visible = false
