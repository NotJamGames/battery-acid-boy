extends Node2D


@export var projectile_resource : Resource

var max_projectiles : int = 128

var available_projectiles : Array[Projectile]
var current_projectile : int = 0


func _ready() -> void:
	for i : int in max_projectiles:
		var new_projectile : Projectile = projectile_resource.instantiate()
		add_child(new_projectile)
		available_projectiles.append(new_projectile)

	Global.projectile_requested.connect(instance_projectile)


func instance_projectile(from_position : Vector2, direction : Vector2) -> void:
	available_projectiles[current_projectile].spawn(from_position, direction)
	current_projectile = wrapi(current_projectile + 1, 0, 128)
