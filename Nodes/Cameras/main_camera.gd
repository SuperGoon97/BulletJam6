class_name MainCamera extends Camera2D

signal is_ready (input:String)

var current_screen_shake_strength:float
var fade_strength:float
var rng:RandomNumberGenerator = RandomNumberGenerator.new()

var shake_for_duration_active:bool = false
var d_current_screen_shake_strength:float
var d_fade_strength:float
var d_fade_strength_time:float

func _ready() -> void:
	is_ready.emit("main_camera")

func shake(strength:float,fade_strength:float):
	if shake_for_duration_active == false:
		current_screen_shake_strength = strength
		while current_screen_shake_strength > 0.1:
			offset = random_offset()
			current_screen_shake_strength = lerpf(current_screen_shake_strength,0.0,fade_strength * get_process_delta_time())
			await get_tree().process_frame
		offset = Vector2(0.0,0.0)

func shake_for_duration(strength:float,fade_strength:float,duration:float):
	d_fade_strength = 0.0
	d_fade_strength_time = fade_strength
	var timer:Timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(shake_duration_timer_callback)
	timer.start(duration)
	current_screen_shake_strength = strength
	shake_for_duration_active = true
	while current_screen_shake_strength > 0.0:
		offset = random_offset()
		current_screen_shake_strength = lerpf(current_screen_shake_strength,0.0,d_fade_strength * get_process_delta_time())
		await get_tree().process_frame
	shake_for_duration_active = false

func shake_duration_timer_callback():
	d_fade_strength = d_fade_strength_time

func random_offset():
	return Vector2(rng.randf_range(-current_screen_shake_strength,current_screen_shake_strength),rng.randf_range(-current_screen_shake_strength,current_screen_shake_strength))
