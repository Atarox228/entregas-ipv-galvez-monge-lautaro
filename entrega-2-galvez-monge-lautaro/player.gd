extends Area2D

@export var speed = 400
@onready var cannon:Sprite2D = $Cannon
var projectile_container:Node

func _ready() -> void:
	pass # Replace with function body.

func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):	
	var direccion = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	var mouse_position:Vector2 = get_global_mouse_position()
	cannon.look_at(mouse_position)
	
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
	
	position.x += direccion * speed * delta
