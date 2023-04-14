extends Control

func _on_start_story_pressed():
	get_tree().change_scene_to_file("res://Menus/Main Menu/menu_story_difficulty.tscn")
	
func _on_start_infinite_pressed():
	get_tree().change_scene_to_file("res://Menus/Main Menu/menu_infinity_difficulty.tscn")  #A metre la scene de sélection level story

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Menus/Option Menu/Options_Menu.tscn")

func _on_quit_pressed():
	get_tree().quit()