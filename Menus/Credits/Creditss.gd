extends Node2D

func _on_animation_player_animation_finished(anim_name):
	get_tree().quit()
