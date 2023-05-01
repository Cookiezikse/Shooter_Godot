extends Node2D

var Enemy = preload("res://Ennemies/Ennemi_1/enemy.tscn")
var Enemy2 = preload("res://Ennemies/Ennemi_2/Enemy2.tscn")
var Boss = preload("res://Ennemies/Boss1/boss_1.tscn")
var Shop = preload("res://shop.tscn")
var random = 0
var mod = 1
var spawn_boss = 0
var shop = 0
@onready var Music = $AudioStreamPlayer
@onready var SHOOP = $Shop

# Methode opti pour faire le mod infini vraiment infini, les mods et faire un nombre x, si c'est inférieur, mod 1
# si supérieur mod 2 etc... et quand ça arrive au mod2
# Garde le global.score, il est inférieur à x etc... 
#Faire un truc pour avoir un x, init du x et si le boss meurt le x augmente de 2000 par exemple, et ducoup c'est infini
# Voila voila 

func _ready():
	Global.grenade1 = 3

func _on_spawn_timeout():
	var Vector = Vector2(randi_range(2,580),randi_range(-5,-5))
	
	if Global.score >= 300:
		mod = 2
		EnnemiVars.Spawn_Infinite = 0.5
	if Global.score >= 1000:
		mod = 3
	if Global.score > 5000:
		mod = 4
	if Global.score > 8000:
		mod = 3
		Global.Boss_amelioration = 1
		Global.amelioration = 1

	if mod == 1:
		var enemy = Enemy.instantiate()
		add_child(enemy)
		enemy.position = Vector
		
	if mod == 2: 
		random = (randi() %2 + 1)
		if random == 1:
			var enemy2 = Enemy2.instantiate()
			add_child(enemy2)
			enemy2.position = Vector
		if random == 2:
			var enemy = Enemy.instantiate()
			add_child(enemy)
			enemy.position = Vector
			
	if mod == 3 && spawn_boss == 0:
		var Boss_Spawn = Boss.instantiate()
		add_child(Boss_Spawn)
		spawn_boss = 1

	if mod == 4:
		spawn_boss = 0
		random = (randi() %2 + 1)
		if random == 1:
			var enemy2 = Enemy2.instantiate()
			add_child(enemy2)
			enemy2.position = Vector
		if random == 2:
			var enemy = Enemy.instantiate()
			add_child(enemy)
			enemy.position = Vector
	
func _on_audio_stream_player_finished():
	Music.play()
