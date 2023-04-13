extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://map.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Options_Menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
