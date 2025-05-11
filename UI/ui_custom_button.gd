@tool
class_name UICustomButton extends Control

signal clicked

@export var button_color:Color = Color(0.0,0.0,0.0)
@export var text_color:Color = Color(1.0,1.0,1.0)
@export var button_text:String = "TEST"

@onready var tex_button_up: NinePatchRect = $tex_button_up
@onready var tex_button_down: NinePatchRect = $tex_button_down
@onready var text_control: Control = $text_control

@onready var text: Label = $text_control/text
@onready var text_under: Label = $text_control/text_under

func _process(delta: float) -> void:
	modulate_buttons()
	text.text = button_text
	text_under.text = text.text

func modulate_buttons():
	tex_button_up.self_modulate = button_color
	tex_button_down.self_modulate = (button_color*Color(0.9,0.9,0.9,1.0))
	text.self_modulate = text_color

func _on_mouse_entered() -> void:
	button_down(true)
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	button_down(false)
	pass # Replace with function body.

func button_down(state:bool):
	tex_button_up.visible = !state
	tex_button_down.visible = state
	if state:
		text_control.position = text_control.position + Vector2.DOWN
	else:
		text_control.position = text_control.position + Vector2.UP


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_released("lmb"):
		clicked.emit()
	pass # Replace with function body.
