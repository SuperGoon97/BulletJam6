class_name BulletSpawner extends Node2D

const CAROUSEL_BULLET = preload("res://Nodes/Bullets/carousel_bullet.tscn")
const STATIC_BULLET = preload("res://Nodes/Bullets/static_bullet.tscn")
const EXPLODING_BULLET = preload("res://Nodes/Bullets/exploding_bullet.tscn")
const BULLET = preload("res://Nodes/Bullets/bullet.tscn")
@export var base_bullet_scale:float = 0.5

## Spawn bullet type defaults to normal
func spawn_bullet(speed:float , team:Gv.team , direction :Vector2 , color:GradientTexture1D , angle:float = 0.0 , size:float = 1.0 , bullet_type:Gv.BT = Gv.BT.NORMAL):
	var new_bullet:BulletBase = return_bullet_base(bullet_type)
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
	return new_bullet

func return_bullet_base(bullet_type:Gv.BT) -> BulletBase:
	var return_bullet:BulletBase
	match bullet_type:
		Gv.BT.NORMAL:
			return_bullet = BULLET.instantiate()
		Gv.BT.EXPLODING:
			return_bullet = EXPLODING_BULLET.instantiate()
		Gv.BT.STATIC:
			return_bullet = STATIC_BULLET.instantiate()
		Gv.BT.CAROUSEL:
			return_bullet = CAROUSEL_BULLET.instantiate()
	return return_bullet
