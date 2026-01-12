extends Area2D

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var survivalTime = get_tree().get_first_node_in_group("SurvivalTime")


var game_over : bool = false

func _process(delta: float) -> void:
	if overlaps_body(player):
		get_parent().queue_free
		game_over = true
	
	if game_over == true:
		get_tree().reload_current_scene()
		var resultsString = "%s;%s;A\n" % [survivalTime.text, "0"]
		write_line_to_file(resultsString)
		  

func write_line_to_file(content):
	var file = FileAccess.open("res://results.csv", FileAccess.READ_WRITE)
	file.seek_end()
	file.store_string(content)
	file.close()
