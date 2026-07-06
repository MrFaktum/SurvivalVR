extends MeshInstance3D

var active_tween: Tween
var mat: StandardMaterial3D

func _ready():
	# Умный поиск материала (найдет его, даже если он внутри Mesh)
	mat = get_active_material(0) as StandardMaterial3D
	
	if mat:
		mat.albedo_color.a = 0.0 # Прячем экран при старте

# 1. ВСПЫШКА (Вызывается из mouth.gd при отравлении)
func trigger_effect(target_color: Color, duration: float = 3.0):
	if not mat: return # Защита от краша
	
	target_color.a = 0.0
	mat.albedo_color = target_color
	
	if active_tween: active_tween.kill()
	active_tween = create_tween()
	active_tween.tween_property(mat, "albedo_color:a", 0.4, 0.5)
	active_tween.tween_interval(duration)
	active_tween.tween_property(mat, "albedo_color:a", 0.0, 1.0)

# 2. ПОСТОЯННЫЙ ЭФФЕКТ (Для пустыни)
func set_constant(target_color: Color):
	if not mat: return
	
	target_color.a = mat.albedo_color.a
	mat.albedo_color = target_color
	
	if active_tween: active_tween.kill()
	active_tween = create_tween()
	active_tween.tween_property(mat, "albedo_color:a", 0.3, 2.0)

# 3. ОЧИСТКА ЭКРАНА (Выход из пустыни)
func clear():
	if not mat: return
	
	if active_tween: active_tween.kill()
	active_tween = create_tween()
	active_tween.tween_property(mat, "albedo_color:a", 0.0, 2.0)
