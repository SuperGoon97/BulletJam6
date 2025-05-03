class_name ScoreLabel extends Label

@export var desired_place_value:int = 7
@onready var score_label_shadow: Label = $score_label_shadow

func update_score(score:int):
	var score_string = str(score)
	var length = score_string.length()
	var zero_to_add = desired_place_value - length
	if zero_to_add > 0:
		text = "SCORE " + add_zeros(zero_to_add,score)
		score_label_shadow.text = text
	else:
		text = "SCORE " + str(score)
		score_label_shadow.text = text

func add_zeros(zero_to_add:int , score:int) -> String:
	var r_string:String
	var p_string:PackedStringArray
	for n in zero_to_add:
		p_string.push_back("0")
	r_string = "".join(p_string) + str(score)
	return r_string
