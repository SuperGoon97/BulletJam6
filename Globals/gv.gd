extends Node

const color_pallete:ColorPalette = preload("res://Resources/lospec_pallette.tres")

enum team {
enemy,
ally,
}
## Bullet pattern type
enum BPT {
basic,
shotgun,
fountain,
twin,
circle,
circle2,
}
## Enemy type
enum ET {
SIMPLE,
SHOOTER,
SHOTGUN,
STRAFER,
BASIC_TWIN,
}
## Bullet type
enum BT {
	NORMAL,
	EXPLODING,
	STATIC,
	CAROUSEL,
}
var game_manager :GameManager :
	get:
		return game_manager
	set(input):
		game_manager = input
		Gf.game_manager = game_manager
		print("Game manager loaded")
