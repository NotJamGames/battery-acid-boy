class_name Enemy
extends Node2D


var enabled : bool = false


func set_enabled(new_state : bool) -> void:
	enabled = new_state
	if new_state:
		flash(7)
		attack()
	else:
		visible = false


func flash(max_iterations : int, current_iteration : int = 0) -> void:
	if current_iteration == max_iterations: return

	visible = not visible

	get_tree().create_timer(.08).timeout.connect\
			(flash.bind(max_iterations, current_iteration + 1))


func attack() -> void:
	pass
