extends Area2D

var player = false

func _process(delta):
	if player:
		if Input.is_action_pressed("ui_accept"):
			Global.Scene2 = "res://Niveaux/Infinite/map.tscn"
			get_tree().change_scene_to_file("res://Menus/Main Menu/menu_difficulty.tscn")

func _on_body_entered(body):
	player = true

func _on_body_exited(body):
	player = false
