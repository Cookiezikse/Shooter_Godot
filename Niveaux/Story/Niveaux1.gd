extends Node2D

var Enemy = preload("res://Ennemies/Ennemi_1/enemy.tscn")
var Enemy2 = preload("res://Ennemies/Ennemi_2/Enemy2.tscn")
var random = 0
func _on_spawn_timeout():
	random = (randi() %2 + 1)
	print(random)
	if random == 1:
		var enemy = Enemy.instantiate()
		add_child(enemy)
		enemy.position = Vector2(randi_range(2,580),randi_range(-5,-5))
	if random == 2: 
		var enemy = Enemy2.instantiate()
		add_child(enemy)
		enemy.position = Vector2(randi_range(2,580),randi_range(-5,-5))
