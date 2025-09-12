extends CharacterBody2D

@onready var cannon: Node = $Cannon
@onready var ground_check: RayCast2D = $RayCast2D

@export var ACCELERATION: float = 20.0
@export var H_SPEED_LIMIT: float = 600.0
@export var FRICTION_WEIGHT: float = 0.1
@export var JUMP_FORCE: float
@export var GRAVITY:float = 5

#var velocity: Vector2 = Vector2.ZERO
var projectile_container: Node

func initialize(projectile_container: Node) -> void:
	self.projectile_container = projectile_container
	cannon.projectile_container = projectile_container

func _physics_process(delta):
	_rotation_cannon()
	_fire_cannon()
	_movement(delta)
	velocity.y += GRAVITY

func _rotation_cannon():
	var mouse_position: Vector2 = get_global_mouse_position()
	cannon.look_at(mouse_position)

func _fire_cannon():
	if Input.is_action_just_pressed("fire_cannon"):
		if projectile_container == null:
			projectile_container = get_parent()
			cannon.projectile_container = projectile_container
		cannon.fire()

func _movement(delta):
	# Player movement
	var h_movement_direction: int = int(
		Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")
	)
	var velocity = self.velocity
	
	if h_movement_direction != 0:
		velocity.x = clamp(
			velocity.x + (h_movement_direction * ACCELERATION),
			-H_SPEED_LIMIT,
			H_SPEED_LIMIT
		)
	else:
		velocity.x = lerp(velocity.x, 0.0, FRICTION_WEIGHT) if abs(velocity.x) > 1.0 else 0.0
	
	if Input.is_action_just_pressed("jump") and ground_check.is_colliding(): 
		velocity.y = -JUMP_FORCE
	
	self.velocity = velocity
	#colision
	move_and_slide()
	#colision contra rigid
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			var body := c.get_collider() as RigidBody2D
			var contact_point = c.get_position() - body.global_position
			body.apply_impulse(-c.get_normal() * velocity.length() * 0.5, contact_point)
	


	
	
