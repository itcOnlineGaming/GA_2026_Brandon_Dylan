extends Node2D

@onready var timer = get_tree().get_first_node_in_group("Timer")

var enemyScene = load("res://enemy.tscn")

var timer_wait = 1.0

func _on_timer_timeout() -> void:
	add_child(enemyScene.instantiate())
	timer_wait -= 0.05
	if timer_wait <= 0.35:
		timer_wait = 0.35
	timer.set_wait(timer_wait)
	timer.start()
