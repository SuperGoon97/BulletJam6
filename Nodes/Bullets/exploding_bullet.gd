class_name ExplodingBullet extends BulletBase

const DUMB_BULLET_GRADIENT = preload("res://Resources/dumb_bullet_gradient.tres")

@onready var bullet_spawner: BulletSpawner = $BulletSpawner
@onready var bullet_pattern_node: BulletPatternNode = $BulletPatternNode

func _on_bullet_explode_timer_timeout() -> void:
	var pattern:BulletPattern = bullet_pattern_node.bullet_pattern
	for b in pattern.number_of_shots:
		bullet_spawner.spawn_bullet(pattern.speed,Gv.team.enemy,pattern.direction,DUMB_BULLET_GRADIENT,pattern.angle_sequence[b])
	pass # Replace with function body.
