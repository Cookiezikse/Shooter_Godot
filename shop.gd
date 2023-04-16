extends Control

func _on_tir_body_entered(body):
	if Global.score > 2000:
		Global.amelioration = 1

func _on_atk_speed_body_entered(body):
	if Global.score > 1400:
		Global.atk_speed = 0.2
