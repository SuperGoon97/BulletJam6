class_name GameManager extends Node

signal game_ready
signal score_changed(score:int)

const BULLET_MANAGER = preload("res://Nodes/Mangers/bullet_manager.tscn")
const UI_MANAGER = preload("res://Nodes/Mangers/ui_manager.tscn")
const WAVE_MANAGER = preload("res://Nodes/Mangers/wave_manager.tscn")

var bullet_manager :BulletManager
var ui_manager :UiManager
var wave_manager :WaveManager

var current_score:int = 0

var manager_dict :Dictionary = {
"bullet_manager":false ,
"ui_manager":false ,
"wave_manager":false ,
}

func _ready() -> void:
	Gv.set("game_manager" , self)
	create_managers()
	check_loading_state()
	pass

func create_managers():
	bullet_manager = BULLET_MANAGER.instantiate()
	bullet_manager.is_ready.connect(manager_ready)
	add_child(bullet_manager)
	wave_manager = WAVE_MANAGER.instantiate()
	wave_manager.is_ready.connect(manager_ready)
	wave_manager.enemy_created.connect(bind_to_enemy_death)
	add_child(wave_manager)
	ui_manager = UI_MANAGER.instantiate()
	ui_manager.is_ready.connect(manager_ready)
	score_changed.connect(ui_manager.update_score_label)
	add_child(ui_manager)

func manager_ready (input:String):
	manager_dict[input] = true
	print(input + " is loaded")
	pass

func check_loading_state():
	while manager_dict.values().all(Gf.equal_true) == false:
		await get_tree().process_frame
	game_ready.emit()
	print("Game ready")

func bind_to_enemy_death(enemy:Enemy):
	enemy.destroyed_by_player.connect(change_score)

func change_score(value:int):
	current_score += value
	score_changed.emit(current_score)
