extends Control


var alive : bool = true
var current_score : float

@export var replay_button : Button
@export var score_label : Label
@export var health_bar : ProgressBar

signal restart_requested()


func _process(delta : float) -> void:
	if not alive: return

	current_score += delta

	score_label.text = "%05d" % int(current_score)


func update_max_health(new_max_health : float) -> void:
	health_bar.size.x = new_max_health
	health_bar.max_value = new_max_health


func update_health_bar(new_value : float) -> void:
	health_bar.value = new_value


func set_alive(new_state : bool) -> void:
	alive = new_state
	if not alive: replay_button.visible = true


func restart() -> void:
	restart_requested.emit()
