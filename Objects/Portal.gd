tool

extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
export var next_scene: PackedScene

func _get_configuration_warning():
	return 'next_scene property cannot be empty!' if not next_scene else ''

func teleport_to_next_scene():
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)


func _on_Portal_body_entered(body):
	teleport_to_next_scene()
