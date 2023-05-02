extends Node2D

var Enemy = preload("res://Ennemies/Ennemi_1/enemy.tscn")
var Enemy2 = preload("res://Ennemies/Ennemi_2/Enemy2.tscn")
var Boss = preload("res://Ennemies/Boss1/boss_1.tscn")
var Shop = preload("res://shop.tscn")
var random = 0
var mod = 2
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
	if Global.DIFF == 1:
		EnnemiVars.Speed_atk_Boss_1 = 0.2
		EnnemiVars.Health_Boss_1 = 50
		EnnemiVars.Spawn_point_Boss_1 = 12
	if Global.DIFF == 2:
		EnnemiVars.Spawn_point_Boss_1 = 11
		EnnemiVars.Speed_atk_Boss_1 = 0.15
		EnnemiVars.Health_Boss_1 = 75
	if Global.DIFF == 3:
		EnnemiVars.Spawn_point_Boss_1 = 15
		EnnemiVars.Speed_atk_Boss_1 = 0.1
		EnnemiVars.Health_Boss_1 = 100
func _on_spawn_timeout():
	var Vector = Vector2(randi_range(2,580),randi_range(-5,-5))
	
	if Global.score <= Global.x:
		mod = 2
		EnnemiVars.Spawn_Infinite = 0.5
	if Global.score >= Global.x:
		mod = 3

		

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

func _on_audio_stream_player_finished():
	Music.play()
