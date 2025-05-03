class_name Enemy extends Node2D

@export_range(0.0,100.0,0.1,"or_greater") var speed:float = 10.0
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
		destroy_enemy_slow()

func destroy_enemy_slow():
	await get_tree().create_timer(0.5).timeout
	queue_free()
