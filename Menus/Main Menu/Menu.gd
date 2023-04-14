extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Niveaux/Infinite/map.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Menus/Option Menu/Options_Menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
