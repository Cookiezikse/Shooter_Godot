extends Node2D

func _ready():
	Global.score = 0

func _on_spawn_timeout():
	if Global.Boss_dead:
		Global.Game_Over = true
		Global.Niveau3_clear = true
		get_tree().change_scene_to_file("res://Menus/Select Menu/select_menu1.tscn")

