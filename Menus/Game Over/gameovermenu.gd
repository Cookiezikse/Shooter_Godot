extends Control

func _on_restart_pressed():
	get_tree( ).change_scene_to_file("res://Niveaux/Infinite/map.tscn")
	
func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Menus/Main Menu/Menu.tscn")
