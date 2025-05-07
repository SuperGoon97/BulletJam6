class_name AnomalyGravity extends Anomaly

@onready var anomaly_area: Area2D = $anomaly_area
@export var is_pull:bool = true
@export var strength:float = 100.0
var overlapped:Array[Node2D]

func _on_anamoly_event_timeout():
	pass

func _on_anomaly_area_area_entered(area: Area2D) -> void:
	if area is HitBox:
		var node:Node2D = area.owner_root_node
		overlapped.push_back(node)

func _on_anomaly_area_area_exited(area: Area2D) -> void:
	if area is HitBox:
		var node:Node2D = area.owner_root_node
		var index = overlapped.find(node)
		overlapped.remove_at(index)

func _process(delta: float) -> void:
	for node in overlapped:
		var vec_normal:Vector2 = Vector2(node.global_position - global_position).normalized()
	pass
