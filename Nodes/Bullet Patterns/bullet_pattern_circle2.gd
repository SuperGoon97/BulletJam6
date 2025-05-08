class_name BulletPatternCircle2 extends BulletPattern

func _init() -> void:
	speed = 100
	direction = Vector2(0.0 , 1.0)
	time_between_shots = 0.0
	number_of_shots = 12
	create_angle_squence(-PI , PI , number_of_shots , 1)
