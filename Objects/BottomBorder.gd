extends Area2D



func _on_BottomBorder_body_entered(body):
	body.queue_free()
	get_tree().reload_current_scene()
