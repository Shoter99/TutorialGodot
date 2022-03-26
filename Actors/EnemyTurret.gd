extends KinematicBody2D

onready var bullet = preload("res://Objects/Bullet.tscn")


func _get_configuration_warning():
	return 'bullet property cannot be empty' if not bullet else '' 

func _ready():
	while 1:
		shoot()
		yield(get_tree().create_timer(2.0), "timeout")


func getpos() -> Vector2:
	return get_node("GunPoint").global_position

func shoot():
	var instance = bullet.instance()
	instance.position = getpos()
	print("shoot!")
