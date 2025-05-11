extends Anomaly

@onready var anomaly_area: Area2D = $anomaly_area

func duplicate_object(node:Node2D):
	if node.is_in_group("enemy"):
		var enemy:Enemy = node
		if enemy.can_duplicate:
			var enemy_parent = enemy.get_parent()
			var new_enemy:Enemy = enemy.duplicate()
			var game_manager:GameManager = Gv.get("game_manager")
			game_manager.bind_to_enemy_death(new_enemy)
			enemy.can_duplicate = false
			new_enemy.can_duplicate = false
			enemy_parent.call_deferred("add_child",new_enemy)
			new_enemy.set_deferred("global_position",enemy.global_position)
			enemy.direction = enemy.direction.rotated(PI/9)
			new_enemy.direction = (-enemy.direction)
	elif node.is_in_group("bullet"):
		var bullet:BulletBase = node
		var new_bullet
		if bullet is StaticBullet:
			return
		if bullet is CarouselBullet:
			new_bullet = bullet.duplicate(8)
		else:
			new_bullet = bullet.duplicate()
		var bullet_parent = bullet.get_parent()
		bullet_parent.call_deferred("add_child",new_bullet)
		new_bullet.set_deferred("global_position",bullet.global_position)
		var dir = bullet.direction
		bullet.direction = dir.rotated(PI/9)
		new_bullet.direction = dir.rotated(-PI/9)

func _on_anamoly_event_timeout() -> void:
	super()
	for area in anomaly_area.get_overlapping_areas():
		if area is HitBox:
			var parent_node = area.owner_root_node
			duplicate_object(parent_node)
