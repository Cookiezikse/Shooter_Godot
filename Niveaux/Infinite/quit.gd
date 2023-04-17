extends Area2D

var player = false

func _process(delta):
	if player:
		if Input.is_action_pressed("ui_accept"):
			emit_signal("script_changed")

func _on_body_entered(body):
	player = true

func _on_body_exited(body):
	player = false
