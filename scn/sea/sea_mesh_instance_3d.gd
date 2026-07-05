extends MeshInstance3D

# Создаем пустую переменную, которая будет хранить ссылку на наш материал
var material: StandardMaterial3D

func _ready():
	# При старте игры: берем наш Mesh, забираем с него материал №0
	# и кладем его в нашу переменную 'material'
	material = mesh.surface_get_material(0)

func _process(delta):
	# Каждый кадр берем наш материал и сдвигаем его UV-координаты.
	# delta нужна, чтобы скорость была одинаковой при любой частоте кадров
	material.uv1_offset.x += 0.5 * delta
	material.uv1_offset.z += 0.6 * delta
