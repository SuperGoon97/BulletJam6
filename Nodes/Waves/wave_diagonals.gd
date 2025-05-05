class_name WaveThree extends Wave

func _init() -> void:
	number_of_spawns = 24
	position_sequence = [0 , 6 , 7 , 9 , 0 , 6 , 7 , 9 , 0 , 6 , 7 , 9 , 0 , 6 , 7 , 9 , 0 , 6 , 7 , 9 , 0 , 6 , 7 , 9 , 0 , 6 , 7 , 9]
	for n in number_of_spawns:
		if position_sequence[n] == 9:
			cooldown_sequence.append(1)
		else:
			cooldown_sequence.append(0)
		if n%2 == 0:
			direction_sequence.append(Vector2(4.0 , 1.0))
		else:
			direction_sequence.append(Vector2(-4.0 , 1.0))
		speed_sequence.append(75)
		type_sequence.append(Gv.ET.SHOOTER)
		score_sequence.append(10)
