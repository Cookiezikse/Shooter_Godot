extends Control

# Mettre juste un truc de si il appui sur un bouton il peut ajouter un joueur, sinon c'est trop chiant


@onready var Player2 = $Player2/Sprite2D
@onready var Player = $Player

var Player2_scene = preload("res://Player2/Player2.tscn")
	
func _on_start_story_pressed():
	emit_signal("JOUEURS")
	get_tree().change_scene_to_file("res://Menus/Main Menu/menu_story_difficulty.tscn")
	
func _on_start_infinite_pressed():
	get_tree().change_scene_to_file("res://Menus/Main Menu/menu_infinity_difficulty.tscn")  #A metre la scene de sélection level story

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Menus/Option Menu/Options_Menu.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_spawn_player_body_entered(body):
	if Global.P2_dead == 1:
		Global.P2_dead = 0
		var Player2 = Player2_scene.instantiate()
		get_tree().root.add_child(Player2)
		Player2.position = Player.global_position + Vector2(0,50)
	elif Global.P2_dead == 0 && Global.P3_dead == 1:
		pass #Rajouter le 3 eme joueur et en refaire un pour ajouter le 4 eme joueur
