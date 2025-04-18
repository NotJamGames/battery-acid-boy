class_name Player
extends CharacterBody2D


@export var animated_sprite : AnimatedSprite2D


const SPEED : float = 48.0


func _physics_process(delta : float) -> void:
	velocity = Vector2\
			(Input.get_axis("move_left", "move_right"),
			Input.get_axis("move_up", "move_down")).normalized() * SPEED

	move_and_slide()

	if velocity.is_zero_approx():
		animated_sprite.play("Idle")
	else:
		animated_sprite.play("Run")
