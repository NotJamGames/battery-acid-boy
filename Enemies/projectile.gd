class_name Projectile
extends CharacterBody2D


const SPEED : float = 32.0


func _ready() -> void:
	reset()


func spawn(from_position : Vector2, direction : Vector2) -> void:
	position = from_position
	velocity = direction
	set_physics_process(true)


func _physics_process(delta : float) -> void:
	var collision : KinematicCollision2D = move_and_collide\
			(velocity * SPEED * delta)

	if collision:
		var collider : Node2D = collision.get_collider()
		if collider is Player:
			collider.hit()
		reset()


func reset() -> void:
	set_physics_process(false)
	position = Vector2(-64.0, -64.0)
