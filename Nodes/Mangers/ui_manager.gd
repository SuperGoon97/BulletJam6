class_name UiManager extends Control

signal is_ready (input:String)

const SCORE_LABEL = preload("res://UI/Labels/score_label.tscn")

var score_label:ScoreLabel

func _ready() -> void:
	create_score_label()
	is_ready.emit("ui_manager")

func create_score_label():
	score_label = SCORE_LABEL.instantiate()
	add_child(score_label)

func update_score_label(score:int):
	score_label.update_score(score)
