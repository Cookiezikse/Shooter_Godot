extends Control

<<<<<<< Updated upstream
func _on_restart_body_entered(body):
	get_tree( ).change_scene_to_file(Global.Scene2)
	Global.score=0
	Global.grenade1=3

func _on_quit_body_entered(body):
	get_tree().change_scene_to_file("res://Menus/Main Menu/Menu.tscn")
	Global.score=0
	Global.grenade1=3
=======
func _process(delta):
	if Global.score>Global.meilleurScore:
		Global.meilleurScore=Global.score
>>>>>>> Stashed changes
