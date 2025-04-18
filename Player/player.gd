class_name Player
extends CharacterBody2D


@export var animated_sprite : AnimatedSprite2D

const SPEED : float = 48.0
const MAX_PRINTS : int = 12

var is_in_pool : bool = true
var prints_placed : int = 0

signal place_print()


func _physics_process(_delta : float) -> void:
	velocity = Vector2\
			(Input.get_axis("move_left", "move_right"),
			Input.get_axis("move_up", "move_down")).normalized() * SPEED

	move_and_slide()

	if velocity.is_zero_approx():
		animated_sprite.play("Idle")
	else:
		animated_sprite.play("Run")


func set_is_in_pool(body : Node2D, new_state : bool) -> void:
	if not body is Player: return
	is_in_pool = new_state
	if is_in_pool: prints_placed = 0


func place_footprint() -> void:
	if is_in_pool or animated_sprite.animation != "Run" \
	or (animated_sprite.frame != 1 and animated_sprite.frame != 3): return

	var print_position : Vector2i = \
			Vector2i(position) + Vector2i(4, 6)
	var print_strength : float = \
			(float(MAX_PRINTS - prints_placed)) / float(MAX_PRINTS)

	place_print.emit(print_position, print_strength)
	prints_placed += 1
