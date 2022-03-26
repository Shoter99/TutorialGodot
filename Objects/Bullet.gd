extends Actor

export var bullet_speed = 10


func _ready():
	var timer = $Timer
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.wait_time = 2.0
	timer.start()


func _physics_process(delta):
	get_node(".").global_position.x -= bullet_speed * delta


func _on_timer_timeout():
	queue_free()


func _on_Bullet_body_entered(body):
	queue_free()
