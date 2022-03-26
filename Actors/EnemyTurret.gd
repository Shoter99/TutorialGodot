extends Actor

onready var bullet = preload("res://Objects/Bullet.tscn")

onready var timer = $Timer

func _get_configuration_warning():
	return 'bullet property cannot be empty' if not bullet else '' 

func _ready():
	timer.set_wait_time(2)
	timer.connect("timeout", self, "shoot")
	timer.start()
	
func _physics_process(delta):
	velocity.y += gravity*delta
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	

func getpos() -> Vector2:
	return get_node("GunPoint").position

func shoot():
	var instance = bullet.instance()
	instance.position = getpos()
	add_child(instance)
	timer.set_wait_time(2)
