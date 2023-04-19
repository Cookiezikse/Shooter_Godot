extends Node2D

var Enemy = preload("res://Ennemies/Ennemi_1/enemy.tscn")
var Enemy2 = preload("res://Ennemies/Ennemi_2/Enemy2.tscn")
var random = 0
const count = 20
func _on_spawn_timeout():

	if count < Global.Death_ennemi1:
		get_tree().change_scene_to_file("res://Menus/Select Menu/select_menu1.tscn")
	var enemy = Enemy.instantiate()
	add_child(enemy)
	enemy.position = Vector2(randi_range(2,580),randi_range(-5,-5))
