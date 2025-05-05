extends Wave

func _init() -> void:
	number_of_spawns = 12
	for n in number_of_spawns:
		cooldown_sequence.append(0.5)
		if n%2 == 0:
			position_sequence.append(7)
			direction_sequence.append(Vector2(1.0 , 0.0))
		else:
			position_sequence.append(10)
			direction_sequence.append(Vector2(-1.0 , 0.0))
		speed_sequence.append(200)
		type_sequence.append(Gv.ET.STRAFER)
		score_sequence.append(30)
	print (type_sequence)
