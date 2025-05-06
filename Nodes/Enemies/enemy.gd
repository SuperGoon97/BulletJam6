class_name Enemy extends Node2D

signal destroyed_by_player(score_to_give:int)

@export_range(0.0,100.0,0.1,"or_greater") var speed:float = 10.0
@export var score_value:int = 10
@onready var enemy_sprite: Sprite2D = $enemy_moving_components/enemy_sprite
@onready var enemy_explodes: AnimatedSprite2D = $enemy_explodes
@onready var enemy_death_sound: AudioStreamPlayer = $enemy_explodes/enemy_death_sound
@onready var enemy_hitbox: Area2D = $enemy_moving_components/enemy_hitbox
@onready var enemy_anim_player: AnimationPlayer = $enemy_anim_player

var direction:Vector2 = Vector2(0.0,1.0)
var active = true
var is_alive = true
var can_duplicate = true

func _ready() -> void:
	enemy_anim_player.play("wobble")

func _process(delta: float) -> void:
	if is_alive:
		position += (direction * speed * delta)

func _on_enemy_onscreen_screen_entered() -> void:
	active = true

func _on_enemy_onscreen_screen_exited() -> void:
	if active:
		destroy_enemy_offscreen()

func destroy_enemy_offscreen():
	await get_tree().create_timer(0.5).timeout
	queue_free()

func damage():
	destroy()

func destroy():
	is_alive = false
	enemy_hitbox.set_collision_layer_value(2 , false)
	destroyed_by_player.emit(score_value)
	enemy_explodes.play()
	enemy_explodes.show()
	enemy_sprite.hide()
	enemy_death_sound.play()
	await enemy_explodes.animation_finished
	queue_free()
