extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var player_pos : Vector2 = player.position

@export var speed : float = 1000.0
var movement_vector : Vector2

func _ready() -> void:
	
	var version : bool = bool(randi() % 2)
	if version:
		speed = 1000.0
	else:
		speed = 500.0
	
	var side_value = bool(randi() % 2)
	if side_value:
		var left_right = bool(randi() % 2)
		if left_right:
			position.x = 1600
		else:
			position.x  = -100
		position.y = randi_range(0, 1500)
	else:
		var up_down = bool(randi() % 2)
		if up_down:	
			position.y = 1600
		else:
			position.y  = -100
		position.x = randi_range(0, 1500)
	
	
	movement_vector = ((position - player_pos).normalized() * speed) * -1
	velocity += movement_vector

func _process(delta: float) -> void:
	move_and_slide()

	
