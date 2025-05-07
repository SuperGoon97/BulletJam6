class_name WaveNode extends Node

signal spawn(pos,speed,dir,type,score)
signal wave_spawn_finish()

var wave:Wave:
	get:
		return wave
	set(value):
		wave = value
		spawn_wave()

func spawn_wave():
	for n in wave.number_of_spawns:
		spawn.emit(wave.position_sequence[n] , wave.speed_sequence[n] , wave.direction_sequence[n] , wave.type_sequence[n] , wave.score_sequence[n])
		await get_tree().create_timer(wave.cooldown_sequence[n]).timeout
	wave_spawn_finish.emit()
func destroy():
	queue_free()
