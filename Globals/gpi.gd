extends Node

signal spacebar_pressed (spacebar :bool)

const UI_MENU = preload("res://Menus/ui_menu.tscn")

var space_held :bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		space_held = true
		spacebar_pressed.emit(space_held)
	elif event.is_action_released("fire"):
		space_held = false
		spacebar_pressed.emit(space_held)
	if event.is_action_released("ui_cancel"):
		if Gv.in_game:
			get_tree().get_first_node_in_group("level").add_child(UI_MENU.instantiate())
