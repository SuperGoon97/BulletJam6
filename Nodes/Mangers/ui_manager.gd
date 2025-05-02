class_name UiManager extends Control

signal is_ready (input:String)

func _ready() -> void:
	is_ready.emit("ui_manager")
