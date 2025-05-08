class_name Boss extends Node2D

signal destroyed_by_player(score_to_give:int)

@onready var boss_turret_1: BossTurretSide = $boss_turret_1
@onready var boss_turret_2: BossTurretSide = $boss_turret_2
@onready var boss_centre_turret: BossCentreTurret = $boss_centre_turret
@onready var boss_animations: AnimationPlayer = $boss_animations

var spawn_pos :Vector2 = Vector2(0.0 , -550)
var target_pos :Vector2 = Vector2(0.0 , -210)
var active :bool = false
var dead :bool = false
var score_value = 1000

func _process(delta: float) -> void:
	if boss_turret_1.alive == false && boss_turret_2.alive == false && boss_centre_turret.alive == false && dead == false:
		destroy()

func move_to_target_pos():
	var tween = get_tree().create_tween()
	tween.tween_property(self , "global_position" , target_pos , 10.0)
	await tween.finished
	active = true
	boss_turret_1.active = true
	boss_turret_1.boss_hitbox.set_collision_layer_value(2 , true)
	boss_turret_2.active = true
	boss_turret_2.boss_hitbox.set_collision_layer_value(2 , true)
	boss_centre_turret.active = true
	boss_centre_turret.boss_hitbox.set_collision_layer_value(2 , true)
	boss_centre_turret.shoot()
	boss_centre_turret.shooting_timer.start()

func _ready() -> void:
	move_to_target_pos()

func destroy():
	dead = true
	Gf.screen_shake_for_duration(8.0,2.0,10.0)
	boss_animations.play("boss_death_animation")
	destroyed_by_player.emit(score_value)
