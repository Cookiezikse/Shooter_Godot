extends Node2D

func _ready():
	Global.Boss_amelioration = 1
	Global.score = 0

func _on_spawn_timeout():
	if Global.Boss_dead:
		Global.Game_Over = true
		Global.Niveau4_clear = true
		get_tree().change_scene_to_file("res://Menus/Select Menu/select_menu1.tscn")
