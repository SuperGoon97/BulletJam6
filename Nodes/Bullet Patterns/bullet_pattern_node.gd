class_name BulletPatternNode extends Node

@export var bullet_pattern_type :Gv.BPT
var bullet_pattern :GDScript

func _ready() -> void:
	update_bullet_pattern()

func update_bullet_pattern():
	match bullet_pattern_type:
		Gv.BPT.basic:
			bullet_pattern = BulletPatternBasic.new()
		Gv.BPT.shotgun:
			bullet_pattern = BulletPatternShotgun.new()
		Gv.BPT.fountain:
			bullet_pattern = BulletPatternFountain.new()
		Gv.BPT.twin:
			bullet_pattern = BulletPatternTwin.new()
		Gv.BPT.circle:
			bullet_pattern = BulletPatternCircle.new()
		Gv.BPT.circle2:
			bullet_pattern = BulletPatternCircle2.new()
