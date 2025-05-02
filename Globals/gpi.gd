extends Node

signal spacebar_pressed (spacebar :bool)

var space_held :bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		space_held = true
		spacebar_pressed.emit(space_held)
	elif event.is_action_released("fire"):
		space_held = false
		spacebar_pressed.emit(space_held)
