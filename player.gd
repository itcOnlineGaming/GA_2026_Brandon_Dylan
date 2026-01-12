extends CharacterBody2D

var m_speed : float = 5.0

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("move_left"):
		position.x -= 1 * m_speed
	if Input.is_action_pressed("move_right"):
		position.x += 1 * m_speed 
	if Input.is_action_pressed("move_down"):
		position.y += 1 * m_speed 
	if Input.is_action_pressed("move_up"):
		position.y -= 1 * m_speed 

	move_and_slide()
