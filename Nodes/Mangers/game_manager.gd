class_name GameManager extends Node

signal game_ready
signal score_changed(score:int)

const BULLET_MANAGER = preload("res://Nodes/Mangers/bullet_manager.tscn")
const UI_MANAGER = preload("res://Nodes/Mangers/ui_manager.tscn")
const WAVE_MANAGER = preload("res://Nodes/Mangers/wave_manager.tscn")
const MAIN_CAMERA = preload("res://Nodes/Cameras/main_camera.tscn")

const FADING_SCREEN = preload("res://Nodes/fading_screen.tscn")

var bullet_manager :BulletManager
var ui_manager :UiManager
var wave_manager :WaveManager
var main_camera: MainCamera

var current_score:int = 0

var manager_dict :Dictionary = {
"bullet_manager":false ,
"ui_manager":false ,
"wave_manager":false ,
"main_camera":false , 
}

func _ready() -> void:
	Gv.set("game_manager" , self)
	create_camera()
	create_managers()
	check_loading_state()

func create_managers():
	bullet_manager = BULLET_MANAGER.instantiate()
	bullet_manager.is_ready.connect(manager_ready)
	add_child(bullet_manager)
	wave_manager = WAVE_MANAGER.instantiate()
	wave_manager.is_ready.connect(manager_ready)
	wave_manager.enemy_created.connect(bind_to_enemy_death)
	wave_manager.boss_defeated.connect(end_game)
	add_child(wave_manager)
	ui_manager = UI_MANAGER.instantiate()
	ui_manager.is_ready.connect(manager_ready)
	score_changed.connect(ui_manager.update_score_label)
	ui_manager.scale = Vector2(1.0/main_camera.zoom.x,1.0/main_camera.zoom.y)
	ui_manager.position = (Vector2(ui_manager.pivot_offset.x * (1 - main_camera.zoom.x),ui_manager.pivot_offset.y * (1 - main_camera.zoom.y)))
	main_camera.add_child(ui_manager)
	var player:Player = get_tree().get_first_node_in_group("Player")
	player.player_died.connect(player_died)

func create_camera():
	main_camera = MAIN_CAMERA.instantiate()
	main_camera.is_ready.connect(manager_ready)
	add_child(main_camera)

func manager_ready (input:String):
	manager_dict[input] = true
	print(input + " is loaded")

func check_loading_state():
	while manager_dict.values().all(Gf.equal_true) == false:
		await get_tree().process_frame
	game_ready.emit()
	get_tree().paused = false
	print("Game ready")

func bind_to_enemy_death(enemy:Enemy):
	enemy.destroyed_by_player.connect(change_score)

func change_score(value:int):
	current_score += value
	score_changed.emit(current_score)

func end_game(is_win:bool = true):
	var fade_screen:FadingScreen = FADING_SCREEN.instantiate()
	ui_manager.add_child.call_deferred(fade_screen)
	if is_win:
		await fade_screen.complete
	else:
		fade_screen.set_deferred("label_text","YOU LOSE")
		await fade_screen.complete
	pass

func player_died():
	end_game(false)
	pass
