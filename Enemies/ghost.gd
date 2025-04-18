extends Enemy



func attack() -> void:
	var direction_to_player = (Global.player_position - position).normalized()
	Global.spawn_projectile(position, direction_to_player)
	get_tree().create_timer(1.8).timeout.connect(attack)
