class_name FadingScreen extends ColorRect

signal complete()

@onready var starting_col = color

@onready var label: Label = $Label
@onready var ui_custom_button: UICustomButton = $ui_custom_button
@onready var ui_custom_button_2: UICustomButton = $ui_custom_button2

func _ready() -> void:
	var tween:Tween = create_tween()
	tween.tween_property(self,"color",Color(starting_col.r,starting_col.g,starting_col.b,1.0),2.0)
	tween.tween_callback(make_visible)
func make_visible():
	for child in get_children():
		child.visible = true


func _on_exit_button_clicked() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_menu_button_clicked() -> void:
	get_tree().change_scene_to_file("res://Menus/title_screen.tscn")
	pass # Replace with function body.
