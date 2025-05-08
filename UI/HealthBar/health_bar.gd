class_name HealthBar extends Node2D

@onready var glitch_effect: Sprite2D = $glitch_effect
@onready var health_bar_full_anchor: Node2D = $health_bar_full_anchor
var health_dict :Dictionary = {
4:1,
3:0.75,
2:0.5,
1:0.25,
0:0
}

func update_health_bar(current_health:int):
	health_bar_full_anchor.scale = Vector2(health_dict[current_health] , health_bar_full_anchor.scale[1])
	flicker_glitch()
	

func flicker_glitch():
	glitch_effect.visible = true
	await get_tree().create_timer(0.1).timeout
	glitch_effect.visible = false
