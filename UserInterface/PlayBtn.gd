tool

extends Button

export var next_scene: PackedScene

func _get_configuration_warning():
	return 'next_scene property cannot be empty!' if not next_scene else ''

func _on_PlayBtn_button_up():
	get_tree().change_scene_to(next_scene)
