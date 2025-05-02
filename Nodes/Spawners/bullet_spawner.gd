class_name BulletSpawner extends Node2D

const BULLET = preload("res://Nodes/Bullets/bullet.tscn")

func _ready() -> void:
	pass

func spawn_bullet(angle:float , speed:float , team:Gv.team):
	var new_bullet:BulletBase = BULLET.instantiate()
	new_bullet.direction = new_bullet.direction.rotated(angle)
	new_bullet.speed = speed
	new_bullet.global_position = global_position
	get_tree().get_first_node_in_group("level").add_child(new_bullet)
