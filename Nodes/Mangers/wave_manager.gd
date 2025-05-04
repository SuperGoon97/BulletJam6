class_name WaveManager extends Node2D
signal is_ready (input:String)
signal enemy_created(enemy:Enemy)

const Wave1 = preload("res://Nodes/Waves/wave_1.gd")
const Wave2 = preload("res://Nodes/Waves/wave_2.gd")

@onready var enemy_spawner_0: EnemySpawner = $enemy_spawner0
@onready var enemy_spawner_1: EnemySpawner = $enemy_spawner1
@onready var enemy_spawner_2: EnemySpawner = $enemy_spawner2
@onready var enemy_spawner_3: EnemySpawner = $enemy_spawner3
@onready var enemy_spawner_4: EnemySpawner = $enemy_spawner4
@onready var enemy_spawner_5: EnemySpawner = $enemy_spawner5
@onready var enemy_spawner_6: EnemySpawner = $enemy_spawner6
@onready var enemy_spawner_7: EnemySpawner = $enemy_spawner7
@onready var enemy_spawner_8: EnemySpawner = $enemy_spawner8
@onready var enemy_spawner_9: EnemySpawner = $enemy_spawner9
@onready var enemy_spawner_10: EnemySpawner = $enemy_spawner10
@onready var spawner_array:Array[EnemySpawner] = [enemy_spawner_0 , enemy_spawner_1 , enemy_spawner_2 , enemy_spawner_3 , 
enemy_spawner_4 , enemy_spawner_5 , enemy_spawner_6 , enemy_spawner_7 , enemy_spawner_8 , enemy_spawner_9 , enemy_spawner_10]

func _ready() -> void:
	run_waves()
	is_ready.emit("wave_manager")

func spawn_at(location:int , speed:float , direction:Vector2 , type:Gv.ET):
	var new_enemy :Enemy
	new_enemy = spawner_array[location].spawn_enemy(speed , direction.normalized() , type)
	enemy_created.emit(new_enemy)

func spawn_wave(wave_script :GDScript):
	var wave :Wave = wave_script.new()
	for n in wave.number_of_spawns:
		spawn_at(wave.position_sequence[n] , wave.speed_sequence[n] , wave.direction_sequence[n] , wave.type_sequence[n])
		await get_tree().create_timer(wave.cooldown_sequence[n]).timeout

func run_waves():
	await get_tree().create_timer(3.0).timeout
	spawn_wave(Wave1)
	await get_tree().create_timer(6.0).timeout
	spawn_wave(Wave2)
	
