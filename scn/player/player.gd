extends Node

var xr_interface: XRInterface

func _ready():
	# Ищем интерфейс OpenXR
	xr_interface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR успешно запущен!")
		
		# Отключаем V-Sync (вертикальную синхронизацию), в VR она ломает FPS
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		
		# САМАЯ ГЛАВНАЯ СТРОЧКА: Включаем вывод изображения в шлем!
		get_viewport().use_xr = true
	else:
		print("OpenXR не инициализирован.")
