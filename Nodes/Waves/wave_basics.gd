extends Wave

func _init() -> void:
	number_of_spawns = 12
	position_sequence = [2 , 4 , 1 , 3 , 5 , 2 , 4 , 1 , 3 , 5 , 2 , 4]
	cooldown_sequence = [0.0 , 1.5 , 0.0 , 0.0 , 1.5 , 0.0 , 1.5 , 0.0 , 0.0 , 1.5 , 0.0 , 0.0]
	for n in number_of_spawns:
		direction_sequence.append(Vector2(0.0 , 1.0))
		speed_sequence.append(50)
		type_sequence.append(Gv.ET.BASIC_TWIN)
		score_sequence.append(10)
