class_name BulletTrailParticle extends CPUParticles2D

@onready var bullet_trail_dust: CPUParticles2D = $bullet_trail_dust

var gradient_col_1:Color = Gv.color_pallete.colors[26]
var gradient_col_2:Color = Gv.color_pallete.colors[36]
var new_gradient:Gradient
func _ready() -> void:
	new_gradient = Gradient.new()
	new_gradient.colors[0] = gradient_col_1
	new_gradient.colors[1] = gradient_col_2
	color_ramp = new_gradient
	set_bullet_trail_colors()

func set_bullet_trail_colors():
	bullet_trail_dust.color_ramp = new_gradient
	bullet_trail_dust.color_initial_ramp = new_gradient
