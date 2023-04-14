extends Node2D

var Enemy = preload("res://Ennemies/Ennemi_1/enemy.tscn")
var Enemy2 = preload("res://Ennemies/Ennemi_2/Enemy2.tscn")
var enemy = 0
var random = 0
var mod = 1
var Score = Global.score
func _on_spawn_timeout():
	var Vector = Vector2(randi_range(2,580),randi_range(-5,-5))
	if mod == 1:
		var enemy = Enemy.instantiate()
		add_child(enemy)
		enemy.position = Vector
	if Score > 100: #Le if ne marche pas 
		mod == 2
	if mod == 2: 
		random = (randi() %2 + 1)
		print(random)
		if random == 1:
			var enemy = Enemy2.instantiate()
		if random == 2:
			var enemy = Enemy.instantiate()
		add_child(enemy)
		enemy.position = Vector
