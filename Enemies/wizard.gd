extends Enemy


var attack_directions : Array[Array] = \
[
	[Vector2(-1.0, .0), Vector2(.0, -1.0), Vector2(1.0, .0), Vector2(.0, 1.0)],
	[
		Vector2(-1.0, -1.0).normalized(),
		Vector2(1.0, -1.0).normalized(),
		Vector2(-1.0, 1.0).normalized(),
		Vector2(1.0, 1.0).normalized()
	]
]
var current_cycle : int = 0


func attack() -> void:
	current_cycle = wrapi(current_cycle + 1, 0, 2)
	for vector : Vector2 in attack_directions[current_cycle]:
		Global.spawn_projectile(position + Vector2(1.0, .0), vector)

	get_tree().create_timer(3.6).timeout.connect(attack)
