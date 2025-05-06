class_name Boss extends Node2D

@onready var boss_turret_1: BossTurretSide = $boss_turret_1
@onready var boss_turret_2: BossTurretSide = $boss_turret_2
@onready var boss_centre_turret: BossCentreTurret = $boss_centre_turret

var spawn_pos :Vector2 = Vector2(0.0 , -550)
var target_pos :Vector2 = Vector2(0.0 , -210)
var active :bool = false

func move_to_target_pos():
	var tween = get_tree().create_tween()
	tween.tween_property(self , "global_position" , target_pos , 10.0)
	await tween.finished
	active = true
	boss_turret_1.active = true
	boss_turret_2.active = true
	boss_centre_turret.active = true
	boss_centre_turret.shoot()
	boss_centre_turret.shooting_timer.start()

func _ready() -> void:
	move_to_target_pos()
