extends Area2D

var player = false

func _process(delta):
	if player:
		if Input.is_action_pressed("ui_accept"):
			emit_signal("JOUEURS")
			Global.Scene2 = "res://Menus/Select Menu/select_menu1.tscn"
			get_tree().change_scene_to_file("res://Menus/Main Menu/menu_difficulty.tscn")

func _on_body_entered(body):
	player = true

func _on_body_exited(body):
	player = false
