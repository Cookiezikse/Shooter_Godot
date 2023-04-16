extends Control

func _on_back_body_entered(body):
	get_tree().change_scene_to_file("res://Menus/Main Menu/menu_difficulty.tscn")
