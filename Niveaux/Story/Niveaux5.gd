extends Node2D

var Enemy = preload("res://Ennemies/Ennemi_1/enemy.tscn")
var Enemy2 = preload("res://Ennemies/Ennemi_2/Enemy2.tscn")
var Boss_Fin = preload("res://Ennemies/Boss3/boss_3.tscn")
var random = 0
const count = 20
var Count = true
func _on_spawn_timeout():
	if Global.The_END == 1:
		if Count:
			var Boss = Boss_Fin.instantiate()
			Boss.position = Vector2(300,-50)
			get_tree().root.add_child(Boss)
			Count = false
		
