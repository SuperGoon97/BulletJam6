class_name BulletSpawner extends Node2D

const BULLET = preload("res://Nodes/Bullets/bullet.tscn")
@export var base_bullet_scale:float = 0.5

func spawn_bullet(speed:float , team:Gv.team , direction :Vector2 , color:GradientTexture1D , angle:float = 0.0 , size:float = 1.0):
	var new_bullet:BulletBase = BULLET.instantiate()
	var new_bullet_hitbox :Area2D = new_bullet.get_node("bullet_hitbox")
	var new_bullet_sprite :Sprite2D = new_bullet.get_node("bullet_sprite")
	new_bullet.direction = direction
	new_bullet.direction = new_bullet.direction.rotated(angle)
	new_bullet.speed = speed
	new_bullet.global_position = global_position
	new_bullet.call_deferred("set_colors",color)
	new_bullet_hitbox.set_collision_mask_value(team + 1 , true)
	new_bullet_hitbox.set_collision_layer_value(team + 3 , true)
	new_bullet.scale = Vector2(size*base_bullet_scale , size*base_bullet_scale)
	get_tree().get_first_node_in_group("level").add_child(new_bullet)
