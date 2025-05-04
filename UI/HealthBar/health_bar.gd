class_name HealthBar extends Node2D

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
