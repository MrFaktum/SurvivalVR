extends Area3D

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	# Проверяем, что вошел игрок
	if body.name == "PlayerBody":
		var screen = body.get_parent().get_node("Head/ScreenEffect/ScreenEffectMesh")
		if screen:
			screen.set_constant(Color(1.0, 0.4, 0.0)) # Оранжевый цвет жары

func _on_body_exited(body):
	if body.name == "PlayerBody":
		var screen = body.get_parent().get_node("Head/ScreenEffect/ScreenEffectMesh")
		if screen:
			screen.clear() # Убираем жару
