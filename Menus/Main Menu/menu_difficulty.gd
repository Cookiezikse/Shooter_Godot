extends Control

func _on_easy_body_entered(body):
	EnnemiVars.Speed_Ennemi_1 = 1.5
	EnnemiVars.Health_Ennemi_1 = 2
	get_tree().change_scene_to_file(Global.Scene2)

func _on_medium_body_entered(body):
	EnnemiVars.Speed_Ennemi_1 = 1
	EnnemiVars.Health_Ennemi_1 = 3
	get_tree().change_scene_to_file(Global.Scene2)

func _on_hard_body_entered(body):
	EnnemiVars.Speed_Ennemi_1 = 0.7
	EnnemiVars.Health_Ennemi_1 = 4
	get_tree().change_scene_to_file(Global.Scene2)

func _on_back_body_entered(body):
	get_tree().change_scene_to_file("res://Menus/Main Menu/Menu.tscn")
