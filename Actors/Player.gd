extends Actor

export var impuls = 1000.0

func _on_EnemyDetector_area_entered(area):
	velocity = calculate_stomp_vel(velocity, impuls)


func _physics_process(delta) -> void:
	var is_jump_interupted: = Input.is_action_just_released("move_up") and velocity.y < 0.0
	var dir: = getDir() 
	velocity = calculate_vel(velocity, dir, speed, is_jump_interupted)
	velocity = move_and_slide(velocity, FLOOR_NORMAL)
	
func getDir() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	-1.0 if Input.is_action_just_pressed("move_up") and is_on_floor() else 1.0)


func calculate_vel(linear_vel: Vector2 ,dir: Vector2, speed: Vector2, is_jump_interupted: bool) -> Vector2:
	var new_vel = linear_vel
	new_vel.x = speed.x * dir.x
	new_vel.y += gravity * get_physics_process_delta_time()
	if dir.y == -1.0:
		new_vel.y = speed.y * dir.y
	if is_jump_interupted: 
		new_vel.y = 0.0
	return new_vel

func calculate_stomp_vel(linear_vel: Vector2, stomp_impulse: float):
	var out: = linear_vel
	out.y = -stomp_impulse
	return out


func _on_EnemyDetector_body_entered(body):
	queue_free()
	get_tree().reload_current_scene()


func _on_BottomBorder_body_entered(body):
	queue_free()
	get_tree().reload_current_scene()
