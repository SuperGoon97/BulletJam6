class_name Anomaly extends Node2D

@export var time_to_reach_final_scale:float = 1.0
@export var final_scale:Vector2 = Vector2(1.0,1.0)
@onready var anomaly_particle: AnomalyParticle = $anomaly_particle

var dir:Vector2 = Vector2(1.0,-1.0)
var speed:float  = 10.0

func _ready() -> void:
	tween_scale()

func _process(delta: float) -> void:
	position += dir * speed * delta

func tween_scale():
	var tween = create_tween()
	tween.tween_property(self,"scale",final_scale,time_to_reach_final_scale)


func _on_anamoly_event_timeout() -> void:
	anomaly_particle.glitch(0.1)
