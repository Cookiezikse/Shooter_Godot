extends Control

@onready var AnimationText = $AnimationPlayer
var anim = 0
var anim_temp = 0

func _on_animation_player_animation_finished(anim_name):
	if anim == 0:
		AnimationText.play("Text2")
		anim_temp = 1 
	if anim == 1:
		pass
	anim = anim_temp
