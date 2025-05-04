class_name EnemySpawner extends Node2D


const ENEMY = preload("res://Nodes/Enemies/enemy.tscn")
const ENEMY_DUMB_FIRE = preload("res://Nodes/Enemies/enemy_dumb_fire.tscn")
const ENEMY_SHOTGUN = preload("res://Nodes/Enemies/enemy_shotgun.tscn")
const ENEMY_STRAFER = preload("res://Nodes/Enemies/enemy_strafer.tscn")

var enemy_dictionary :Dictionary = {
Gv.ET.SIMPLE:ENEMY,
Gv.ET.SHOOTER:ENEMY_DUMB_FIRE,
Gv.ET.SHOTGUN:ENEMY_SHOTGUN,
Gv.ET.STRAFER:ENEMY_STRAFER
}

func spawn_enemy(speed:float , direction:Vector2 , type:Gv.ET):
	var new_enemy :Enemy = enemy_dictionary[type].instantiate()
	new_enemy.speed = speed
	new_enemy.direction = direction
	add_child(new_enemy)
	return new_enemy
