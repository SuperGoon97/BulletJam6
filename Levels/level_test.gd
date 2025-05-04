class_name LevelTest extends Node2D

@onready var game_manager: GameManager = $game_manager

func _on_player_recieved_damage(current_health: int) -> void:
	game_manager.ui_manager.health_bar.update_health_bar(current_health)
