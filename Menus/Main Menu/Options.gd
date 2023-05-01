extends Area2D

var player = false
@onready var Sound = $Choose4

func _process(delta):
	if player:
		if Input.is_action_pressed("ui_accept"):
			Sound.play()
			get_tree().change_scene_to_file("res://Menus/Option Menu/Options_Menu.tscn")

func _on_body_entered(body):
	player = true

func _on_body_exited(body):
	player = false


