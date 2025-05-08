extends ParallaxBackground

@onready var p_layer_background: ParallaxLayer = $p_layer_background
@onready var p_layer_asteroid: ParallaxLayer = $p_layer_asteroid
@onready var p_layer_stars: ParallaxLayer = $p_layer_stars
@onready var p_layer_planet_1: ParallaxLayer = $p_layer_planet1

func _process(delta: float) -> void:
	p_layer_background.motion_offset.y += 10*delta
	p_layer_asteroid.motion_offset += Vector2(20*delta,40*delta)
	p_layer_stars.motion_offset.y += 12.5*delta
	p_layer_planet_1.motion_offset += Vector2(5*delta, -20*delta)
