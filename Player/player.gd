class_name Player
extends CharacterBody2D


@export var animated_sprite : AnimatedSprite2D
@export var footsteps : AudioStreamPlayer
@export var death_sfx : AudioStreamPlayer

const SPEED : float = 48.0
const MAX_PRINTS : int = 18

var is_in_pool : bool = true
var prints_placed : int = 0

signal place_print()

var max_health : float = 112.0
var current_health : float = 112.0
var health_decrease_rate : float = 6.0
var health_increase_rate : float = 18.0

signal health_updated()
signal died()


func _physics_process(delta : float) -> void:
	velocity = Vector2\
			(Input.get_axis("move_left", "move_right"),
			Input.get_axis("move_up", "move_down")).normalized() * SPEED

	move_and_slide()

	if velocity.is_zero_approx():
		animated_sprite.play("Idle")
	else:
		animated_sprite.play("Run")

	if is_in_pool:
		current_health = minf\
				(current_health + (health_increase_rate * delta), max_health)
	else:
		current_health = clampf\
				(current_health - (health_decrease_rate * delta),
				.0, max_health)
		if is_zero_approx(current_health): die()

	health_updated.emit(current_health)


func set_is_in_pool(body : Node2D, new_state : bool) -> void:
	if not body is Player: return
	is_in_pool = new_state
	if is_in_pool: prints_placed = 0


func place_footprint() -> void:
	if animated_sprite.animation != "Run" \
	or (animated_sprite.frame != 1 and animated_sprite.frame != 3): return

	footsteps.play()

	if is_in_pool: return

	var print_position : Vector2i = \
			Vector2i(position) + Vector2i(4, 6)
	var print_strength : float = \
			(float(MAX_PRINTS - prints_placed)) / float(MAX_PRINTS)

	place_print.emit(print_position, print_strength)
	prints_placed += 1


func die() -> void:
	set_physics_process(false)
	animated_sprite.play("Dead")
	death_sfx.play()
	died.emit()
