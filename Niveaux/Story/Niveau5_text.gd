extends Control

@onready var AnimationText = $AnimationPlayer

var anim = 0
var anim_temp = 0

func _on_animation_player_animation_finished(anim_name):
	if anim == 0:
		AnimationText.play("Text2")
		anim_temp = 1 
	if anim == 1:
		AnimationText.play("Text3")
		anim_temp = 2
	if anim == 2:
		AnimationText.play("Text4")
		anim_temp = 3
	if anim == 3:
		AnimationText.play("Text5")
		anim_temp = 4
	if anim == 4:
		Global.The_END = 1
	anim = anim_temp

