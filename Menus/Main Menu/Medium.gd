extends Area2D

var player = false


func _process(delta):
	if player:
		if Input.is_action_pressed("ui_accept"):
			EnnemiVars.Speed_Ennemi_1 = 1.2
			EnnemiVars.Health_Ennemi_1 = 3
			EnnemiVars.Spawn_point_Boss_1 = 11
			EnnemiVars.Speed_atk_Boss_1 = 0.15
			EnnemiVars.Health_Boss_1 = 75
			EnnemiVars.Speed_atk_Boss_FIN = 0.1
			Global.DIFF = 2
			get_tree().change_scene_to_file(Global.Scene)

func _on_body_entered(body):
	player = true

func _on_body_exited(body):
	player = false


