extends Area2D

var player = false

func _process(delta):
	if player:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene_to_file(Global.Scene2)
			Global.score = 0

func _on_body_entered(body):
	player = true

func _on_body_exited(body):
	player = false
