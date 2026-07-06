extends Area3D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# Если коснулся игрок (телом)
	if body.name == "PlayerBody":
		trigger_poison(body.get_parent().get_node("Head/ScreenEffect/ScreenEffectMesh"))
	
	# Если игрок коснулся рукой (утиная типизация: у XR-рук есть метод get_tracker_name)
	elif body.has_method("get_tracker_name"):
		var xr_origin = body.get_parent() # Получаем корень Player
		trigger_poison(xr_origin.get_node("Head/ScreenEffect/ScreenEffectMesh"))

func trigger_poison(screen):
	if screen:
		screen.trigger_effect(Color(0.5, 0.0, 0.5), 4.0) # Фиолетовая или зеленая вспышка
