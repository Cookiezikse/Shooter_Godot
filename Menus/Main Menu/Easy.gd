extends Area2D

var player = false


func _process(delta):
	if player:
		if Input.is_action_pressed("ui_accept"):
			EnnemiVars.Speed_Ennemi_1 = 1.5
			EnnemiVars.Health_Ennemi_1 = 2
			EnnemiVars.Spawn_point_Boss_1 = 10
			EnnemiVars.Speed_atk_Boss_1 = 0.2
			EnnemiVars.Health_Boss_1 = 50
			get_tree().change_scene_to_file(Global.Scene)

func _on_body_entered(body):
	player = true

func _on_body_exited(body):
	player = false

