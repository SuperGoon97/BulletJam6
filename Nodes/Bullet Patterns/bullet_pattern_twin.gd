class_name BulletPatternTwin extends BulletPattern

func _init() -> void:
	speed = 120
	direction = Vector2(0.0 , 1.0)
	time_between_shots = 0.0
	number_of_shots = 2
	create_angle_squence(-PI/10 , PI/10 , number_of_shots)
