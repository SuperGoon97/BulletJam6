extends Node

const color_pallete:ColorPalette = preload("res://Resources/lospec_pallette.tres")

enum team {
enemy,
ally,
}

var game_manager :GameManager :
	get:
		return game_manager
	set(input):
		game_manager = input
		print("Game manager loaded")
