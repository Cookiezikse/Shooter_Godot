extends Node2D

var Enemy2 = preload("res://Ennemies/Ennemi_2/Enemy2.tscn")
var Boss_Fin = preload("res://Ennemies/Boss3/boss_3.tscn")
var random = 0
const count = 20
var Count = true
func _on_spawn_timeout():
	if Global.FIGHT == 1:
		var enemy = Enemy2.instantiate()
		add_child(enemy)
		enemy.position = Vector2(randi_range(2,580),randi_range(-5,-5))
	if Global.The_END == 1:
		if Count:
			var Boss = Boss_Fin.instantiate()
			Boss.position = Vector2(300,-50)
			get_tree().root.add_child(Boss)
			Count = false
		
