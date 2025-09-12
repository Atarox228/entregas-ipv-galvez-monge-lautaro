extends Sprite2D

@onready var lifetime_timer = $LifetimeTimer

@export var VELOCITY: float = 800.0

var direction:Vector2

func _ready():
	if lifetime_timer:
		lifetime_timer.timeout.connect( Callable(self, "_on_lifetime_timer_timeout"))


func initialize(spawn_position: Vector2, direction: Vector2):  
	self.direction = direction
	global_position = spawn_position
	if lifetime_timer:      
		lifetime_timer.start()


func _physics_process(delta):
	position += direction * VELOCITY * delta
	# para que los proyectiles funcionen siempre dentro de la vista del jugador
	var cam = get_viewport().get_camera_2d()
	if cam:
		var visible_rect = Rect2(
		cam.get_screen_center_position() - get_viewport().get_visible_rect().size / 2,
		get_viewport().get_visible_rect().size)

# Si supero una cantidad de tiempo de vida
func _on_lifetime_timer_timeout():
	_remove()

func _remove():
	queue_free()
	
