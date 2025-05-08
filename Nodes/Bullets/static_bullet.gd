class_name StaticBullet extends BulletBase

var shrink_and_disapear:bool = true
var pre_cleanup_timer_duration:float
func _ready() -> void:
	super()
	if shrink_and_disapear:
		await get_tree().create_timer(auto_cleanup_time-1.0).timeout
		shrink()

func shrink():
	var tween:Tween = create_tween()
	tween.tween_property(self,"scale",Vector2.ZERO,1.0).set_ease(Tween.EASE_IN)

func set_colors(gradient:GradientTexture1D):
	bullet_sprite.self_modulate = gradient.gradient.sample(0.0) * 2.0
	bullet_trail_particle.set_bullet_trail_colors(gradient)
	bullet_trail_particle.set_bullet_trail_scale(scale.x - 0.5)
	bullet_trail_particle.set_bullet_trail_length(speed)

func _process(delta: float) -> void:
	pass
