extends Area2D

@onready var player = get_tree().get_first_node_in_group("Player")

var game_over : bool = false

func _process(delta: float) -> void:
	if overlaps_body(player):
		get_parent().queue_free
		game_over = true
	
	if game_over == true:
		get_tree().reload_current_scene()
