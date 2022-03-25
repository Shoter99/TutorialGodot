extends Actor

func _physics_process(delta):
	var dir: = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 1.0)
	
	velocity = speed * dir
	
