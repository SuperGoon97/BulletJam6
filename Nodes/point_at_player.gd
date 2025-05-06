class_name PointAtPlayer extends Node2D

@export var angular_velocity :float = 0.3
var direction :Vector2 = Vector2(0.0 , 1.0)
var target :Node2D
var active :bool = true

func _ready() -> void:
	target = get_tree().get_first_node_in_group("Player")

func _process(delta: float) -> void:
	if active == true:
		track_player(delta)

func track_player(delta):
	if target:
		var target_direction :Vector2 = (target.global_position - global_position).normalized()
		direction.angle_to(target_direction)
		rotate_turret(direction.angle_to(target_direction) , angular_velocity , delta)

func rotate_turret(target_angle:float , angular_speed:float , time:float):
	if angular_speed*time > abs(target_angle):
		rotate(target_angle)
		direction = direction.rotated(target_angle)
	else:
		var angle_to_rotate_through :float = angular_speed*time*(target_angle/(abs(target_angle)))
		rotate(angle_to_rotate_through)
		direction = direction.rotated(angle_to_rotate_through)
