extends Node

var game_manager:GameManager

func equal_true(state):
	return state == true

func screen_shake(strength:float,fade_strength:float):
	game_manager.main_camera.shake(strength,fade_strength)

func screen_shake_for_duration(strength:float,fade_strength:float,duration:float):
	game_manager.main_camera.shake_for_duration(strength,fade_strength,duration)
