class_name BulletPattern extends GDScript

var speed :float = 100.0
var direction :Vector2 = Vector2(0.0 , 1.0)
var time_between_shots :float = 0.0
var angle_sequence :Array
var number_of_shots :int

func create_angle_squence(inital_angle , final_angle , total_shots , ping_pong = 1):
	var temp_array :Array
	var shots_per_pp :int = total_shots/ping_pong 
	if shots_per_pp == 1:
		temp_array = [inital_angle] 
	else:
		for n in shots_per_pp:
			temp_array.push_back(inital_angle + ((final_angle-inital_angle)/(shots_per_pp - 1))*n)
	for n in ping_pong:
		if n%2 == 0:
			angle_sequence.append_array(temp_array)
		else:
			temp_array.reverse()
			angle_sequence.append_array(temp_array)
			temp_array.reverse()
