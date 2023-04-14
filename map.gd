extends Node2D

var Enemy = preload("res://Enemy.tscn")

func _on_spawn_timeout():
	print("Spawning enemy...")
	var enemy = Enemy.instantiate()
	add_child(enemy)
	enemy.position = Vector2(randi_range(2,580),randi_range(-5,-5))
