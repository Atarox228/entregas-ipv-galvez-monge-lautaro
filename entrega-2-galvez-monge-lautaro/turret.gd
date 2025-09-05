extends Area2D

@export var projectile_scene:PackedScene
@onready var fire_position = $FirePosition
var player
var projectile_container:Node

func set_values(playerP,projectile_containerP):
	self.player = playerP
	self.projectile_container = projectile_containerP
	$Timer.start()

func _ready():
	pass


func _on_timer_timeout() -> void:
	fire()
	
func fire():
	var projectile:Projectile = projectile_scene.instantiate()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position, (player.global_position - fire_position.global_position).normalized())
	projectile.delete_request.connect(_on_projectile_delete_requested)
	
func _on_projectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
		
