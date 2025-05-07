class_name BulletBase extends Node2D


@export_range(0.0,100.0,0.1,"or_greater") var speed:float = 10.0
@export var auto_cleanup_time:float = 10.0

@onready var bullet_sprite: Sprite2D = $bullet_sprite
@onready var bullet_trail_particle: BulletTrailParticle = $bullet_sprite/bullet_trail_particle
@onready var bullet_auto_cleanup_timer: Timer = $bullet_auto_cleanup_timer

var direction:Vector2 = Vector2(1.0,0.0)

func _ready() -> void:
	bullet_auto_cleanup_timer.start(auto_cleanup_time)

func _process(delta: float) -> void:
	position += (direction * speed * delta)

func set_colors(gradient:GradientTexture1D):
	bullet_sprite.self_modulate = gradient.gradient.sample(0.0) * 2.0
	bullet_trail_particle.set_bullet_trail_colors(gradient)
	bullet_trail_particle.set_bullet_trail_scale(scale.x)
	bullet_trail_particle.set_bullet_trail_length(speed)

func _on_bullet_hitbox_area_entered(area: Area2D) -> void:
	if area is HitBox:
		var node = area.owner_root_node
		node.damage()
		destroy()

func _on_bullet_onscreen_screen_exited() -> void:
	destroy_bullet_slow()

func destroy_bullet_slow():
	await get_tree().create_timer(0.5).timeout
	queue_free()

func destroy():
	queue_free()

func _on_bullet_auto_cleanup_timer_timeout() -> void:
	destroy()
