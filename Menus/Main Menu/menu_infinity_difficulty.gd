extends Control

var Map = "res://Niveaux/Infinite/map.tscn"


func _on_easy_pressed():
	AtkSpeedEnnemi.Speed = 1.5
	AtkSpeedEnnemi.Health = 2
	get_tree().change_scene_to_file(Map)

func _on_medium_pressed():
	AtkSpeedEnnemi.Speed = 1
	AtkSpeedEnnemi.Health = 3
	get_tree().change_scene_to_file(Map)

func _on_hard_pressed():
	AtkSpeedEnnemi.Speed = 0.7
	AtkSpeedEnnemi.Health = 4
	get_tree().change_scene_to_file(Map)


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Menus/Main Menu/Menu.tscn")
