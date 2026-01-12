extends Node2D

@onready var timer = get_tree().get_first_node_in_group("Timer")
@onready var survivalTime = get_tree().get_first_node_in_group("SurvivalTime")

var enemyScene = load("res://enemy.tscn")

var timer_wait = 1.0

var total_time = 0.0;

func _on_timer_timeout() -> void:
	add_child(enemyScene.instantiate())
	timer_wait -= 0.05
	if timer_wait <= 0.35:
		timer_wait = 0.35
	timer.set_wait(timer_wait)
	timer.start()

func	 _process(delta):
	total_time += delta
	var minutes = int(total_time / 60)
	var seconds = int(total_time) % 60
	var milliseconds = int((total_time - int(total_time)) * 1000)
	
	survivalTime.text = "%02d:%02d:%03d" % [minutes, seconds, milliseconds]
