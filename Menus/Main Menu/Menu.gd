extends Control

# Mettre juste un truc de si il appui sur un bouton il peut ajouter un joueur, sinon c'est trop chiant

@onready var Player = $Player
@onready var Player2 = $Player2

var Player2_scene = preload("res://Player2/Player2.tscn")

func _on_spawn_player_body_entered(body):
	if Global.P2_dead == 1:
		Global.P2_dead = 0
		var Player2 = Player2_scene.instantiate()
		get_tree().root.add_child(Player2)
		Player2.position = Player.global_position + Vector2(0,50)
	elif Global.P2_dead == 0 && Global.P3_dead == 1:
		pass #Rajouter le 3 eme joueur et en refaire un pour ajouter le 4 eme joueur

func _on_destroy_player_body_entered(body):
	#Mettre avant la meme mais pour P4 et ensuite P3
	if Global.P2_dead == 0:
		Global.P2_dead = 1
		
func _on_start_story_body_entered(body):
	emit_signal("JOUEURS")
	Global.Scene2 = "res://Menus/Select Menu/select_menu1.tscn"
	get_tree().change_scene_to_file("res://Menus/Main Menu/menu_difficulty.tscn")


func _on_start_infinite_body_entered(body):
	Global.Scene2 = "res://Niveaux/Infinite/map.tscn"
	get_tree().change_scene_to_file("res://Menus/Main Menu/menu_difficulty.tscn")  #A metre la scene de sélection level story

func _on_options_body_entered(body):
	get_tree().change_scene_to_file("res://Menus/Option Menu/Options_Menu.tscn")


func _on_quit_body_entered(body):
	get_tree().quit()
