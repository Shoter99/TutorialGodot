extends Area2D

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

func _ready():
	anim_player.play("bouncing")

func _on_Coin_body_entered(body):
	anim_player.play("fading")
