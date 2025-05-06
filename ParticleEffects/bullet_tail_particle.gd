class_name BulletTrailParticle extends CPUParticles2D

@onready var bullet_trail_dust: CPUParticles2D = $bullet_trail_dust
var base_amount:int = 5
var base_lifetime = 0.33

func set_bullet_trail_colors(gradient:GradientTexture1D):
	var g = gradient.gradient
	color_ramp = g
	bullet_trail_dust.color_ramp = g
	bullet_trail_dust.color_initial_ramp = g

func set_bullet_trail_length(speed:float):
	var speed_scale = (speed/1000.0)/4.0
	amount = base_amount * (speed/150.0)
	lifetime = clampf((base_lifetime * (150.0/speed)),0.1,0.5)
	bullet_trail_dust.lifetime = lifetime * 1.1
	scale_curve_y = scale_curve_y.duplicate()
	for n in scale_curve_y.point_count:
		scale_curve_y.set_point_value(n,scale_curve_y.get_point_position(n).y+speed_scale)
