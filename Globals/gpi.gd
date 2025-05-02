extends Node

signal input_lr(input:Vector2)
signal input_ud(input:Vector2)

func _input(event: InputEvent) -> void:
	var player_input_lr:Vector2 = Vector2(0.0,0.0)
	var player_input_ud:Vector2 = Vector2(0.0,0.0)
	
	if event.is_action("move_left"):
		player_input_lr.x = 1.0
	if event.is_action("move_right"):
		player_input_lr.y = 1.0
	if event.is_action("move_up"):
		player_input_ud.x = 1.0
	if event.is_action("move_down"):
		player_input_ud.y = 1.0
	
	input_lr.emit(player_input_lr)
	input_ud.emit(player_input_ud)
