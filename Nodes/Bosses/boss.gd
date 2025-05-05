class_name Boss extends Node2D

var spawn_pos :Vector2 = Vector2(0.0 , -550)
var target_pos :Vector2 = Vector2(0.0 , -210)

func move_to_target_pos():
	var tween = get_tree().create_tween()
	tween.tween_property(self , "global_position" , target_pos , 10.0)

func _ready() -> void:
	move_to_target_pos()
