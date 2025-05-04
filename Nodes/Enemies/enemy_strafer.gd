class_name EnemyStrafer extends Enemy

@onready var bullet_spawner: BulletSpawner = $bullet_spawner
@onready var shooting_timer: Timer = $shooting_timer
@onready var bullet_pattern_node: BulletPatternNode = $bullet_pattern_node
@onready var bullet_pattern :BulletPattern = bullet_pattern_node.bullet_pattern

func _ready() -> void:
	shooting_timer.start(0.5)

func shoot():
	for n in bullet_pattern.number_of_shots:
		bullet_spawner.spawn_bullet(300 , Gv.team.enemy , Vector2(0.0 , 1.0) , 8 , bullet_pattern.angle_sequence[n])
		await get_tree().create_timer(bullet_pattern.time_between_shots).timeout

func _on_shooting_timer_timeout() -> void:
	shoot()
