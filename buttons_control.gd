class_name ButtonsControl extends VBoxContainer

const UI_CONTROLS = preload("res://UI/ui_controls.tscn")

@onready var play_button: UICustomButton = $play_button

func _ready() -> void:
	if Gv.in_game:
		play_button.button_text = "RESUME"

func _on_play_button_clicked() -> void:
	if !Gv.in_game:
		get_tree().change_scene_to_file("res://Levels/level_test.tscn")
	else:
		get_parent().queue_free()
	pass # Replace with function body.



func _on_controls_button_clicked() -> void:
	get_parent().get_parent().add_child(UI_CONTROLS.instantiate())
	pass # Replace with function body.


func _on_exit_button_clicked() -> void:
	get_tree().quit()
	pass # Replace with function body.
