extends Node

# Эти переменные появятся в Инспекторе
#@export var texture_color: NoiseTexture2D
@export var texture_normal: NoiseTexture2D
#@export var texture_roughness: NoiseTexture2D

func _ready():
	print("Ждем 2 секунды, пока Godot генерирует шум...")
	await get_tree().create_timer(2.0).timeout
	
	# Сохраняем цвет, если текстура добавлена
	#if texture_color:
		#texture_color.get_image().save_png("res://baked_water_color.png")
		#print("Цвет сохранен!")
		
	# Сохраняем нормаль
	if texture_normal:
		texture_normal.get_image().save_jpg("res://baked_water_normal.jpg")
		print("Нормаль сохранена!")
		
	# Сохраняем шероховатость
	#if texture_roughness:
		#texture_roughness.get_image().save_png("res://baked_water_roughness.png")
		#print("Шероховатость сохранена!")
		
	print("Успех! Ищи файлы .png в папке res:// (файловой системе Godot)")
