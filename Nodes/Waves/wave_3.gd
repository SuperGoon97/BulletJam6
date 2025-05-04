class_name WaveThree extends Wave

func _init() -> void:
	number_of_spawns = 16
	position_sequence = [0 , 6 , 7 , 9 , 0 , 6 , 7 , 9 , 0 , 6 , 7 , 9 , 7 , 9 , 8 , 10]
	for n in 12:
		if position_sequence[n] == 9:
			cooldown_sequence.append(1)
		else:
			cooldown_sequence.append(0)
		if n%2 == 0:
			direction_sequence.append(Vector2(2.0 , 1.0))
		else:
			direction_sequence.append(Vector2(-2.0 , 1.0))
		speed_sequence.append(75)
		type_sequence.append(Gv.ET.SHOOTER)

	for n in 4:
		n = n + 12
		cooldown_sequence.append(1)
		if n%2 == 0:
			direction_sequence.append(Vector2(1.0 , 0.0))
		else:
			direction_sequence.append(Vector2(-1.0 , 0.0))
		speed_sequence.append(200)
		type_sequence.append(Gv.ET.STRAFER)
	print (type_sequence)
