extends Area2D

var player = false
@onready var Sound = $Choose


func _process(delta):
	if player:
		if Input.is_action_pressed("ui_accept"):
			get_tree().quit()

func _on_body_entered(body):
	player = true

func _on_body_exited(body):
	player = false

