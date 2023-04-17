extends Area2D

signal Scarafandre

var player = false

func _process(delta):
	if player:
		if Input.is_action_pressed("ui_accept"):
			emit_signal("Scarafandre")

func _on_body_entered(body):
	if body.is_in_group("Player"):
		player = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		player = false
