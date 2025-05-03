class_name WaveManager extends Node2D
signal is_ready (input:String)
signal enemy_created(enemy:Enemy)

const ENEMY = preload("res://Nodes/Enemies/enemy.tscn")
const ENEMY_DUMB_FIRE = preload("res://Nodes/Enemies/enemy_dumb_fire.tscn")

@onready var enemy_spawner_1: EnemySpawner = $enemy_spawner1
@onready var enemy_spawner_2: EnemySpawner = $enemy_spawner2
@onready var enemy_spawner_3: EnemySpawner = $enemy_spawner3
@onready var enemy_spawner_4: EnemySpawner = $enemy_spawner4
@onready var enemy_spawner_5: EnemySpawner = $enemy_spawner5
@onready var spawner_array:Array[EnemySpawner] = [enemy_spawner_1 , enemy_spawner_2 , enemy_spawner_3 , enemy_spawner_4 , enemy_spawner_5]

func _ready() -> void:
	is_ready.emit("wave_manager")

func spawn_at(location:int):
	var new_enemy :Enemy = ENEMY_DUMB_FIRE.instantiate()
	spawner_array[location].add_child(new_enemy)
	new_enemy.global_position = spawner_array[location].global_position
	enemy_created.emit(new_enemy)
	pass

func _on_spawn_timer_timeout() -> void:
	for n in spawner_array.size():
		spawn_at(n)
