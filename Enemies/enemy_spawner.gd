extends Node2D


@onready var enemies : Array[Node] = get_children()
var current_enemy : int = 0

const SPAWN_INTERVAL : float = 8.0


func _ready() -> void:
	for child : Node in enemies:
		var enemy : Enemy = child as Enemy
		enemy.set_enabled(false)

	get_tree().create_timer(1.2).timeout.connect(spawn_enemy)


func spawn_enemy() -> void:
	if current_enemy >= enemies.size(): return

	var enemy : Enemy = enemies[current_enemy] as Enemy
	enemy.set_enabled(true)
	current_enemy += 1

	get_tree().create_timer(SPAWN_INTERVAL).timeout.connect(spawn_enemy)
