extends PlayerState

func enter() -> void:
	
	character.velocity.y -= character.jump_speed
	character._play_animation("jump")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

func exit() -> void:
	pass


# Callback derivado de _input
func handle_input(event: InputEvent) -> void:
	pass


# Callback derivado de _physics_process
func update(delta: float) -> void:
	character._handle_move_input(delta)
	if character.h_movement_direction == 0:
		character._handle_deacceleration(delta)
	character._apply_movement(delta)
	if character.is_on_floor():
		if character.h_movement_direction == 0:
			finished.emit(&"idle")
		finished.emit(&"walk")
	else:
		if character.velocity.y > 0:
			character._play_animation(&"fall")
		else:
			character._play_animation(&"jump")


# Callback cuando finaliza una animación en tiempo del estado actual
func _on_animation_finished(anim_name: StringName) -> void:
	pass


# Callback genérico para eventos manejados como strings.
func handle_event(event: StringName, value = null) -> void:
	match event:
		&"hit":
			character._handle_hit(value)
			if character.dead:
				finished.emit(&"dead")
