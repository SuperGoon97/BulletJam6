class_name BulletPatternBasic extends BulletPattern

func _init() -> void:
	speed = 150
	direction = Vector2(0.0 , 1.0)
	time_between_shots = 0.0
	number_of_shots = 1
	create_angle_squence(0 , 0 , number_of_shots)
