extends Sprite2D
class_name Projectile

signal delete_request(projectile)

@export var speed:float 
var direccion:Vector2

func _ready():
	set_physics_process(false)
	#pass

func set_starting_values(starting_position:Vector2, dir:Vector2):
	global_position = starting_position
	self.direccion = dir
	$Timer.start()
	set_physics_process(true)

func _physics_process(delta):
	position += direccion*speed*delta


func _on_timer_timeout():
	emit_signal("delete_request",self)
