class_name AnomalyGravity extends Anomaly

@onready var anomaly_area: Area2D = $anomaly_area
@export var is_pull:bool = true
@export var strength:float = 7.5
var overlapped:Array[Node2D]

func _ready() -> void:
	start()

func _on_anamoly_event_timeout():
	super()
	is_pull = !is_pull

func _on_anomaly_area_area_entered(area: Area2D) -> void:
	if area is HitBox:
		var node:Node2D = area.owner_root_node
		if !node.is_in_group("Player"):
			overlapped.push_back(node)

func _on_anomaly_area_area_exited(area: Area2D) -> void:
	if area is HitBox:
		var node:Node2D = area.owner_root_node
		if !node.is_in_group("Player"):
			var index = overlapped.find(node)
			overlapped.remove_at(index)

func _process(delta: float) -> void:
	super(delta)
	if is_pull:
		for node in overlapped:
			var vec_normal:Vector2 = Vector2(node.global_position - global_position).normalized()
			if node.direction.angle_to(vec_normal) > 0.05:
				node.direction = node.direction.rotated(-strength * delta)
				if node.speed < 1000:
					node.speed = node.speed + (node.speed*delta)
			elif node.direction.angle_to(vec_normal) < 0.05:
				node.direction = node.direction.rotated(strength * delta)
				if node.speed < 1000:
					node.speed = node.speed + (node.speed*delta)
	else:
		for node in overlapped:
			var vec_normal:Vector2 = Vector2(node.global_position - global_position).normalized()
			if node.direction.angle_to(vec_normal) > 0.05:
				node.direction = node.direction.rotated(strength * delta)
				if node.speed < 1000:
					node.speed = node.speed + (node.speed*delta)
			elif node.direction.angle_to(vec_normal) < 0.05:
				node.direction = node.direction.rotated(-strength * delta)
				if node.speed < 1000:
					node.speed = node.speed + (node.speed*delta)
