class_name UiManager extends Control

signal is_ready (input:String)

const SCORE_LABEL = preload("res://UI/Labels/score_label.tscn")
const HEALTH_BAR = preload("res://UI/HealthBar/health_bar.tscn")

@onready var side_panels: HBoxContainer = $side_panels

var score_label:ScoreLabel
var health_bar:HealthBar

func _ready() -> void:
	get_parent_area_size()
	create_score_label()
	create_health_bar()
	side_panels.z_index = 3
	is_ready.emit("ui_manager")

func create_score_label():
	score_label = SCORE_LABEL.instantiate()
	add_child(score_label)
	score_label.z_index = 4
	score_label.position = Vector2(-562 , -320)
	score_label.scale = Vector2(0.7 , 0.7)

func create_health_bar():
	health_bar = HEALTH_BAR.instantiate()
	add_child(health_bar)
	health_bar.z_index = 4
	health_bar.position = Vector2(562 , -320)

func update_score_label(score:int):
	score_label.update_score(score)
