extends Area3D

@onready var crumbs = $Crumbs # Ссылка на частицы крошек

func _ready():
	body_entered.connect(_on_body_entered)
	
	# ХАК ПРОТИВ VR-ЛАГА:
	# Запускаем частицы один раз при старте игры. 
	# Шлем скомпилирует шейдер крошек заранее.
	crumbs.emitting = true

func _on_body_entered(body: Node3D):
	# Проверяем группу
	if body.is_in_group("Edible"):
		
		# Ищем компонент с данными Node food_data
		var food_data = body.get_node_or_null("FoodData")
		
		# Если компонент найден
		if food_data != null:
			
			# 1. Красим крошки в цвет еды
			crumbs.color = food_data.crumb_color
			
			# 2. Выбрасываем крошки (включаем эмиттер)
			crumbs.emitting = true
			
			# 3. Выводим данные
			print("Съедено! Голод: +", food_data.food_value, " Вода: +", food_data.water_value)
			if food_data.poison_value > 0:
				print("ОТРАВЛЕНИЕ! Урон: ", food_data.poison_value)
				
			# 4. Удаляем саму еду (корневой узел body)
			body.queue_free()
