class_name WaveOne extends Wave

func _init() -> void:
	number_of_spawns = 20
	position_sequence = [2 , 4 , 2 , 4 , 2 , 4 , 2 , 4 , 2 , 4 , 2 , 4 , 2 , 4 , 2 , 4 , 2 , 4 , 2 , 4]
	for n in number_of_spawns:
		cooldown_sequence.append(0.5)
		direction_sequence.append(Vector2(0.0 , 1.0))
		speed_sequence.append(75)
		type_sequence.append(Gv.ET.SHOTGUN)
	print (type_sequence)
