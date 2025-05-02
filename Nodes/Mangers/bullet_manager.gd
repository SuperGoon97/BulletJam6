class_name BulletManager extends Node

signal is_ready (input:String)

func _ready() -> void:
	is_ready.emit("bullet_manager")
