class_name BulletPatternShotgun extends BulletPattern

func _init() -> void:
	speed = 120
	direction = Vector2(0.0 , 1.0)
	time_between_shots = 0.0
	number_of_shots = 3
	create_angle_squence(-PI/8 , PI/8 , number_of_shots)
