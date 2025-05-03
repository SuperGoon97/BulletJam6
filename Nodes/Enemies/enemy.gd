class_name Enemy extends Node2D

signal destroyed_by_player(score_to_give:int)

@export_range(0.0,100.0,0.1,"or_greater") var speed:float = 10.0
@export var score_value:int = 10

var direction:Vector2 = Vector2(0.0,1.0)
var active = true

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position += (direction * speed * delta)

func _on_enemy_onscreen_screen_entered() -> void:
	active = true

func _on_enemy_onscreen_screen_exited() -> void:
	if active:
		destroy_enemy_offscreen()

func destroy_enemy_offscreen():
	await get_tree().create_timer(0.5).timeout
	queue_free()

func destroy():
	destroyed_by_player.emit(score_value)
	queue_free()
