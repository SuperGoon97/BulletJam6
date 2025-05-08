class_name CarouselBullet extends BulletBase
const DUMB_BULLET_GRADIENT = preload("res://Resources/dumb_bullet_gradient.tres")

@onready var bullet_spawner: BulletSpawner = $BulletSpawner
@onready var bullet_pattern_node: BulletPatternNode = $BulletPatternNode
var bullet_array:Array[BulletBase]
var desired_distance = 100.0
func _ready() -> void:
	super()
	await get_tree().create_timer(0.2).timeout
	create_carousel()

func _process(delta: float) -> void:
	super(delta)
	rotate(PI/9*delta*2.0)
func create_carousel():
	var pattern:BulletPattern = bullet_pattern_node.bullet_pattern
	for n in pattern.number_of_shots:
		var new_bullet:BulletBase = bullet_spawner.spawn_bullet(speed,Gv.team.enemy,pattern.direction,DUMB_BULLET_GRADIENT,pattern.angle_sequence[n],1.0,Gv.BT.STATIC)
		new_bullet.reparent(self)
		bullet_array.push_back(new_bullet)
	var tween:Tween = create_tween()
	tween.tween_method(push_out_carousel,0.0,1.0,1.0).set_ease(Tween.EASE_OUT)

func push_out_carousel(alpha:float):
	for b in bullet_array:
		b.position =  b.direction * lerpf(0.0,100.0,alpha)
