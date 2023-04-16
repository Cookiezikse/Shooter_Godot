extends Control

func _on_restart_body_entered(body):
	get_tree( ).change_scene_to_file(Global.Scene2)

func _on_quit_body_entered(body):
	get_tree().change_scene_to_file("res://Menus/Main Menu/Menu.tscn")
