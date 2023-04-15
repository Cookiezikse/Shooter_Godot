extends Control

var P2 = preload("res://Player2/Player2.tscn")

func _on_start_story_pressed():
	emit_signal("JOUEURS")
	get_tree().change_scene_to_file("res://Menus/Main Menu/menu_story_difficulty.tscn")
	
func _on_start_infinite_pressed():
	get_tree().change_scene_to_file("res://Menus/Main Menu/menu_infinity_difficulty.tscn")  #A metre la scene de sélection level story

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Menus/Option Menu/Options_Menu.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_area_2d_body_entered(body):
	if Global.P2_dead == 1:
		var P2_spawn = P2.instantiate()
		get_tree().root.add_child(P2_spawn)
		Global.P2_dead = 0
