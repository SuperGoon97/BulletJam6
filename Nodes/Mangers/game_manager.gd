class_name GameManager extends Node

signal game_ready

const BULLET_MANAGER = preload("res://Nodes/Mangers/bullet_manager.tscn")
const UI_MANAGER = preload("res://Nodes/Mangers/ui_manager.tscn")
const WAVE_MANAGER = preload("res://Nodes/Mangers/wave_manager.tscn")

var bullet_manager :BulletManager
var ui_manager :UiManager
var wave_manager :WaveManager

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
	ui_manager = UI_MANAGER.instantiate()
	ui_manager.is_ready.connect(manager_ready)
	add_child(ui_manager)
	wave_manager = WAVE_MANAGER.instantiate()
	wave_manager.is_ready.connect(manager_ready)
	add_child(wave_manager)
	pass

func manager_ready (input:String):
	manager_dict[input] = true
	print(input + " is loaded")
	pass

func check_loading_state():
	while manager_dict.values().all(Gf.equal_true) == false:
		await get_tree().process_frame
	game_ready.emit()
	print("Game ready")
