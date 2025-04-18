extends Node


var BATTERY_ACID_BOY_RESOURCE : Resource = preload\
		("res://Audio/Music/battery_acid_boy.tscn")


func _ready() -> void:
	var battery_acid_boy_theme : AudioStreamPlayer = \
			BATTERY_ACID_BOY_RESOURCE.instantiate()
	add_child(battery_acid_boy_theme)
