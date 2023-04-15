extends Control

var Map = "res://Menus/Select Menu/select_menu1.tscn"


func _on_easy_pressed():
	EnnemiVars.Speed_Ennemi_1 = 1.5
	EnnemiVars.Health_Ennemi_1 = 2
	get_tree().change_scene_to_file(Map)

func _on_medium_pressed():
	EnnemiVars.Speed_Ennemi_1 = 1
	EnnemiVars.Health_Ennemi_1 = 3
	get_tree().change_scene_to_file(Map)

func _on_hard_pressed():
	EnnemiVars.Speed_Ennemi_1 = 0.7
	EnnemiVars.Health_Ennemi_1 = 4
	get_tree().change_scene_to_file(Map)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Menus/Main Menu/Menu.tscn")
