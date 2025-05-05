class_name BossTurretSide extends Sprite2D

@export var angular_speed :float
var direction :Vector2 = Vector2(0.0 , 1.0)

func track_player():
	var target :Node2D = get_tree().get_first_node_in_group("Player")
	var target_direction :Vector2 = (target.global_position - global_position).normalized()
	
