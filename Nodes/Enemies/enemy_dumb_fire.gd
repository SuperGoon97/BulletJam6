class_name EnemyDumbFire extends Enemy

const DUMB_BULLET_GRADIENT = preload("res://Resources/dumb_bullet_gradient.tres")

@onready var bullet_spawner: BulletSpawner = $enemy_moving_components/bullet_spawner
@onready var shooting_timer: Timer = $shooting_timer
@onready var bullet_pattern_node: BulletPatternNode = $bullet_pattern_node
@onready var bullet_pattern :BulletPattern = bullet_pattern_node.bullet_pattern

func _ready() -> void:
	super()
	shooting_timer.start(2)

func shoot():
	for n in bullet_pattern.number_of_shots:
		bullet_spawner.spawn_bullet(bullet_pattern.speed , Gv.team.enemy ,  Vector2(0.0 , 1.0) , DUMB_BULLET_GRADIENT , bullet_pattern.angle_sequence[n])
		await get_tree().create_timer(bullet_pattern.time_between_shots).timeout

func _on_shooting_timer_timeout() -> void:
	shoot()
