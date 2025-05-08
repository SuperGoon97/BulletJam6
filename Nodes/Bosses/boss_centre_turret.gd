class_name BossCentreTurret extends Node2D

signal destroyed_by_player(score_to_give:int)

const BOSS_FOUNTAIN_BULLET_GRADIENT = preload("res://Resources/boss_fountain_bullet_gradient.tres")

@onready var bullet_spawner: BulletSpawner = $bullet_spawner
@onready var bullet_pattern_node: BulletPatternNode = $bullet_pattern_node
@onready var shooting_timer: Timer = $shooting_timer
@onready var bullet_pattern :BulletPattern = bullet_pattern_node.bullet_pattern
@onready var boss_hitbox: Area2D = $boss_sprite/boss_hitbox
@onready var turret_explodes: AnimatedSprite2D = $turret_explodes
@onready var turret_death_sound: AudioStreamPlayer = $turret_explodes/turret_death_sound
@onready var boss_turret_animation: AnimationPlayer = $boss_turret_animation
@onready var boss_sprite: Sprite2D = $boss_sprite

var active :bool = false
var health :int = 80
var alive :bool = true
var score_value = 100

func shoot():
	for n in bullet_pattern.number_of_shots:
		if alive == true:
			bullet_spawner.spawn_bullet(bullet_pattern.speed , Gv.team.enemy ,  Vector2(0.0 , 1.0) , BOSS_FOUNTAIN_BULLET_GRADIENT , bullet_pattern.angle_sequence[n])
			if bullet_pattern.time_between_shots != 0:
				await get_tree().create_timer(bullet_pattern.time_between_shots).timeout

func _on_shooting_timer_timeout() -> void:
	if active == true:
		shoot()

func damage():
	print(health)
	if boss_turret_animation.is_playing() == false:
		boss_turret_animation.play("damaged")
	if health > 0:
		health = health - 1
		if health == 0:
			destroy()

func destroy():
	boss_hitbox.set_collision_layer_value(2 , false)
	alive = false
	active = false
	destroyed_by_player.emit(score_value)
	turret_explodes.play()
	turret_explodes.show()
	boss_sprite.hide()
	turret_death_sound.play()
	await turret_explodes.animation_finished
	turret_explodes.hide()
