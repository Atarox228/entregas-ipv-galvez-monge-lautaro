extends Node

@export var turret_scene: PackedScene
@export var number_of_turrets: int

#No descubri como evitar que spawneen fuera de objetos solidos
func initialize():
	# Obtener los datos del área
	var spawn_area_node = $SpawnArea
	var collision_shape = spawn_area_node.get_node("CollisionShape2D").shape as RectangleShape2D
	
	var area_position = spawn_area_node.global_position
	
	for i in range(number_of_turrets):
		var turret_instance = turret_scene.instantiate()
		
		# Generar posición aleatoria dentro del rectángulo
		var turret_pos = Vector2(
			randf_range(area_position.x - collision_shape.extents.x, area_position.x + collision_shape.extents.x),
			randf_range(area_position.y - collision_shape.extents.y, area_position.y + collision_shape.extents.y)
		)
		
		
		add_child(turret_instance)
		turret_instance.initialize(turret_pos, self)
