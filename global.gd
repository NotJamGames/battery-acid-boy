extends Node


var BATTERY_ACID_BOY_RESOURCE : Resource = preload\
		("res://Audio/Music/battery_acid_boy.tscn")


var player_position : Vector2 = Vector2.ZERO


signal projectile_requested()


func _ready() -> void:
	var battery_acid_boy_theme : AudioStreamPlayer = \
			BATTERY_ACID_BOY_RESOURCE.instantiate()
	add_child(battery_acid_boy_theme)



func spawn_projectile(from_position : Vector2, direction : Vector2) -> void:
	projectile_requested.emit(from_position, direction)
