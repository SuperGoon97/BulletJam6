class_name BulletBase extends Node2D


@export_range(0.0,100.0,0.1,"or_greater") var speed:float = 10.0
@onready var bullet_sprite: Sprite2D = $bullet_sprite

var direction:Vector2 = Vector2(1.0,0.0)
var active = false

func _ready() -> void:
	bullet_sprite.self_modulate = Gv.color_pallete.colors[26]
func _process(delta: float) -> void:
	position += (direction * speed * delta)

func _on_bullet_hitbox_area_entered(area: Area2D) -> void:
	var node:Node2D = area.get_parent()
	node.queue_free()
	print(node.name)


func _on_bullet_onscreen_screen_exited() -> void:
	if active:
		destroy_bullet_slow()

func _on_bullet_onscreen_screen_entered() -> void:
	active = true
	print("onscreen")

func destroy_bullet_slow():
	await get_tree().create_timer(0.5).timeout
	queue_free()
