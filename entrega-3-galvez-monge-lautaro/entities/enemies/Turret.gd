extends Sprite2D

@onready var fire_position: Node2D = $FirePosition
@onready var fire_timer: Timer = $FireTimer
@onready var ray: RayCast2D = $RayCast2D
@export var projectile_scene: PackedScene
@export var shoot_interval: float = 0.5
@export var ray_length: float = 1000.0

var target: Node2D
var projectile_container: Node
#torreta funciona con mask, player en mask 2 y todo lo demas en 1

#inicializador base para probar torretas manualmente
func _ready():
	if projectile_container == null:
		projectile_container = get_parent()
	fire_timer.wait_time = shoot_interval
	fire_timer.connect("timeout", _try_shot)

# Inicialización desde spawner
func initialize(turret_pos: Vector2, projectile_container: Node) -> void:
	global_position = turret_pos
	self.projectile_container = projectile_container


func _on_detection_area_body_entered(body: Node2D) -> void:
	if target == null and body.name == "Player":
		target = body
		fire_timer.start() 


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == target:
		target = null
		fire_timer.stop()

# Función de disparo controlada por Timer
func _try_shot():
	if target == null:
		return
	
	# Calcula dirección hacia el jugador
	var dir = (target.global_position - global_position).normalized()
	ray.target_position = dir * ray_length
	ray.force_raycast_update()
	
	var hit = ray.get_collider()
	
	# Dispara solo si no hay nada bloqueando al jugador
	if hit == target:
		fire_at_target()

# Instancia el proyectil
func fire_at_target() -> void:
	if projectile_scene == null or projectile_container == null:
		return
	
	var proj_instance = projectile_scene.instantiate()
	proj_instance.initialize(
		#projectile_container,
		fire_position.global_position,
		(fire_position.global_position.direction_to(target.global_position)).normalized()
	)
	projectile_container.add_child(proj_instance)
