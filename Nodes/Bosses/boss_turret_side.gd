class_name BossTurretSide extends PointAtPlayer

const DUMB_BULLET_GRADIENT = preload("res://Resources/dumb_bullet_gradient.tres")
@onready var bullet_spawner: BulletSpawner = $bullet_spawner
@onready var bullet_pattern_node: BulletPatternNode = $bullet_pattern_node
@onready var bullet_pattern :BulletPattern = bullet_pattern_node.bullet_pattern

func _ready() -> void:
	super()
	active = false

func shoot():
	for n in bullet_pattern.number_of_shots:
		bullet_spawner.spawn_bullet(100 , Gv.team.enemy ,  direction , DUMB_BULLET_GRADIENT , bullet_pattern.angle_sequence[n] , 7)
		await get_tree().create_timer(bullet_pattern.time_between_shots).timeout

func _on_shooting_timer_timeout() -> void:
	if active == true:
		shoot()
