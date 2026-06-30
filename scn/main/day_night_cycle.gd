extends DirectionalLight3D

@export var day_speed: float = 10.0 # Сделал быстрее, чтобы ты сразу увидел закат

func _process(delta: float) -> void:
	rotate_x(deg_to_rad(day_speed * delta))
