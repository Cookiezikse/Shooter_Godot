extends Control

@onready var AnimationText = $AnimationPlayer



func _on_animation_player_animation_finished(anim_name):
	AnimationText.play("Text2")
