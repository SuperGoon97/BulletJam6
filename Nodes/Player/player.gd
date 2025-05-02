class_name Player extends Node2D


@export_range(0.0,100.0,0.1,"or_greater") var speed:float = 10.0
@onready var bullet_spawner: BulletSpawner = $bullet_spawner
@onready var shooting_timer: Timer = $shooting_timer
var direction:Vector2 = Vector2(0.0,0.0)
var shooting :bool = false

func _ready() -> void:
	Gpi.spacebar_pressed.connect(spacebar_handler)
	pass

func _process(delta: float) -> void:
	var dir_x = Input.get_axis("move_left" , "move_right")
	var dir_y = Input.get_axis("move_up" , "move_down")
	direction = Vector2(dir_x , dir_y).normalized()
	position += (direction * speed * delta)

func spacebar_handler(input:bool):
	if input == true:
		start_shooting()
		pass
	else:
		stop_shooting()
		pass
	pass

func shoot():
	bullet_spawner.spawn_bullet(-PI/2 , 100 , Gv.team.ally)
	pass

func start_shooting():
	await get_tree().create_timer(shooting_timer.time_left).timeout
	shooting = true
	shoot()
	shooting_timer.start(0.5)
	
func stop_shooting():
	shooting = false
	pass

func _on_shooting_timer_timeout() -> void:
	if shooting == true:
		shoot()
	else:
		shooting_timer.stop()
