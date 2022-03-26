extends Node2D



func _on_SpikesDetector_body_entered(body):
	body.queue_free()
	get_tree().reload_current_scene()
