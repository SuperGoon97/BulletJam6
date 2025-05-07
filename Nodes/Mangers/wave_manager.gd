class_name WaveManager extends Node2D
signal is_ready (input:String)
signal enemy_created(enemy:Enemy)
signal wave_spawn_finished()

const WAVE_NODE = preload("res://Nodes/Waves/wave_node.tscn")

const WaveBasics = preload("res://Nodes/Waves/wave_basics.gd")
const WaveStrafers = preload("res://Nodes/Waves/wave_strafers.gd")
const WaveDiagonals = preload("res://Nodes/Waves/wave_diagonals.gd")
const BOSS = preload("res://Nodes/Bosses/boss.tscn")

@onready var wave_manager_anim_player: AnimationPlayer = $wave_manager_anim_player

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

@onready var anomaly_spawner_0: AnomalySpawner = $anomaly_spawner_0
@onready var anomaly_spawner_1: AnomalySpawner = $anomaly_spawner_1
@onready var anomaly_spawner_2: AnomalySpawner = $anomaly_spawner_2
@onready var anomaly_spawner_3: AnomalySpawner = $anomaly_spawner_3

@onready var anom_spawner_array:Array[AnomalySpawner] = [anomaly_spawner_0,anomaly_spawner_1,anomaly_spawner_2,anomaly_spawner_3]

func _ready() -> void:
	#spawn_boss(BOSS)
	is_ready.emit("wave_manager")
	run_waves()

func spawn_at(location:int , speed:float , direction:Vector2 , type:Gv.ET , score):
	var new_enemy :Enemy
	new_enemy = spawner_array[location].spawn_enemy(speed , direction.normalized() , type , score)
	enemy_created.emit(new_enemy)

func spawn_wave(wave_script :GDScript):
	var n_wave_node:WaveNode = WAVE_NODE.instantiate()
	add_child(n_wave_node)
	n_wave_node.set("wave",wave_script.new())
	n_wave_node.spawn.connect(spawn_at)

##Spawns an anomaly at given location 0-3 inclusive moving along the given direction at the given speed, increases in size to given desired_scale over scale time
func spawn_anomaly_at(anomaly:PackedScene,location:int,direction:Vector2,speed:float,final_scale:Vector2 = Vector2(1.0,1.0),scale_time:float = 1.0):
	var parent_spawner:AnomalySpawner = anom_spawner_array[location]
	var new_anomaly:Anomaly = anomaly.instantiate()
	parent_spawner.add_child(new_anomaly)
	new_anomaly.global_position = parent_spawner.global_position
	new_anomaly.dir = direction
	new_anomaly.speed = speed
	new_anomaly.final_scale = final_scale
	new_anomaly.time_to_reach_final_scale = scale_time
	new_anomaly.start()

func run_waves():
	wave_manager_anim_player.play("stage_one")

func spawn_boss(boss:PackedScene):
	var new_boss :Boss = boss.instantiate()
	new_boss.position = new_boss.spawn_pos
	add_child(new_boss)
	print ("Boss Spanwed")

## This means the stage or boss is finished
func _on_wave_manager_anim_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
