class_name Player extends Node2D

const PLAYER_BLUE_FRAME_01_PNG_PROCESSED = preload("res://Sprites/PlayerShips/PlayerBlue_Frame_01_png_processed.png")
const PLAYER_BLUE_FRAME_02_PNG_PROCESSED = preload("res://Sprites/PlayerShips/PlayerBlue_Frame_02_png_processed.png")
const PLAYER_BLUE_FRAME_03_PNG_PROCESSED = preload("res://Sprites/PlayerShips/PlayerBlue_Frame_03_png_processed.png")

signal recieved_damage(current_health:int)

@export_range(0.0,100.0,0.1,"or_greater") var speed:float = 10.0
@onready var bullet_spawner: BulletSpawner = $bullet_spawner
@onready var shooting_timer: Timer = $bullet_spawner/shooting_timer
@onready var player_sprite: Sprite2D = $player_sprite
@onready var thruster_sprite_1: AnimatedSprite2D = $player_sprite/thruster_sprite1
@onready var thruster_sprite_2: AnimatedSprite2D = $player_sprite/thruster_sprite2
@onready var player_death_animation: AnimatedSprite2D = $player_sprite/player_death_animation
@onready var player_weapon_sound: AudioStreamPlayer = $bullet_spawner/player_weapon_sound


var direction:Vector2 = Vector2(0.0,0.0)
var shooting :bool = false
var health :int = 4

func _ready() -> void:
	Gpi.spacebar_pressed.connect(spacebar_handler)
	thruster_sprite_1.play()
	thruster_sprite_2.play()
	pass

func _process(delta: float) -> void:
	var dir_x = Input.get_axis("move_left" , "move_right")
	var dir_y = Input.get_axis("move_up" , "move_down")
	direction = Vector2(dir_x , dir_y).normalized()
	position += (direction * speed * delta)
	if dir_x > 0:
		player_sprite.texture = PLAYER_BLUE_FRAME_02_PNG_PROCESSED
		player_sprite.flip_h = true
	elif dir_x < 0:
		player_sprite.texture = PLAYER_BLUE_FRAME_02_PNG_PROCESSED
		player_sprite.flip_h = false
	else:
		player_sprite.texture = PLAYER_BLUE_FRAME_01_PNG_PROCESSED

func spacebar_handler(input:bool):
	if input == true:
		start_shooting()
		pass
	else:
		stop_shooting()
		pass
	pass

func shoot():
	bullet_spawner.spawn_bullet(1000 , Gv.team.ally , Vector2(0.0 , -1.0) , 21)
	player_weapon_sound.play()
	pass

func start_shooting():
	await get_tree().create_timer(shooting_timer.time_left).timeout
	shooting = true
	shoot()
	shooting_timer.start(0.1)

func stop_shooting():
	shooting = false
	pass

func _on_shooting_timer_timeout() -> void:
	if shooting == true:
		shoot()
	else:
		shooting_timer.stop()

func damage():
	if health > 0:
		health = health - 1
		recieved_damage.emit(health)
		if health == 0:
			destroy()

func destroy():
	player_death_animation.show()
	player_death_animation.play()
	await player_death_animation.animation_finished
	player_sprite.hide()
	player_death_animation.play()
	await player_death_animation.animation_finished
	queue_free()
