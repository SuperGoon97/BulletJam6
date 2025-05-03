class_name BulletPatternFountain extends BulletPattern

func _init() -> void:
	speed = 100
	direction = Vector2(0.0 , 1.0)
	time_between_shots = 0.1
	number_of_shots = 16
	create_angle_squence(-3*PI/8 , 3*PI/8 , number_of_shots , 2)
