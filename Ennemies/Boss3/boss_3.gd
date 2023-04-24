extends CharacterBody2D

# Faire un script pour choisir des config, en mode avec rotate speed = 100, spawn point = 4 
# Config 1 : rotate speed = 50 shoot timer wait time = 0.2 spawn point count = 6
# Config 2 : rotate speed = 100 shoot timer wait time = 0.1 ou 0.2 spawn point count = 8
# Config 3 : rotate speed = 75 shoot timer wait time = 0.2 spawn point count 12
# Config 4 : Les balles se tirent en cloche en suivant une fonction

const Bullet_scene = preload("res://Ennemies/Boss3/bullet_boss3.tscn")
const Bullet_scene2 = preload("res://Ennemies/Boss2/bullet_boss2.tscn")
# Vu que balles en position.x soit créer autres balles soit créer d'autres attaques
#Si velocity joueur  = 0 , Les balles le tue pas.
#Des coeurs qui bougent et il faut tirer dessus pour débloquer une amélioration.

#Toutes les variables qui vont servir

const speed = 20
var pattern = 1
var FIGHT = 0
var Mod = 1
var pattern_fight = 1

@onready var Mod_Timer = $Mod
@onready var shoot_timer = $ShootTimer
@onready var rotater = $Rotater
@onready var AnimationBoss = $AnimationPlayer

# PATTERN 1

@onready var spawn1_1 = $HD1
@onready var spawn2_1 = $HG1
@onready var spawn3_1 = $BD1
@onready var spawn4 = $BG1

# PATTERN 2

@onready var spawn1_2 = $HD2
@onready var spawn1_3 = $HG2
@onready var spawn1_4 = $HM1
@onready var spawn2_2 = $BG2
@onready var spawn2_3 = $BG3
@onready var spawn3_2 = $BD2
@onready var spawn3_3 = $BD3

var shooter_timer_wait_time = EnnemiVars.Speed_atk_Boss_FIN
var health = EnnemiVars.Health_Boss_FIN
var random_move = (randi_range(1,2))

func _ready():
	shoot_timer.wait_time = shooter_timer_wait_time 
	shoot_timer.start()
	AnimationBoss.play("Spawn")

func _physics_process(delta):
	if Mod == 2:
		if random_move == 1:
			velocity.x = -speed
		if random_move == 2:
			velocity.x = speed
		move_and_slide()

func _on_shoot_timer_timeout() -> void:
	if Global.Game_Over:
		queue_free()
	if Global.FIGHT == 1:
		if pattern_fight == 1 or pattern_fight == 2:
			var bullet = Bullet_scene.instantiate()
			var bullet2 = Bullet_scene2.instantiate()
			for i in range(1,12,1):
				var random = (randi_range(1,4))
				if random == 1:
					bullet.position = spawn1_1.global_position + Vector2((randi_range(-100,100)),0)
					bullet.rotation = -spawn1_1.global_rotation
					get_tree().root.add_child(bullet)
			
				elif random == 2:
					bullet.position = spawn2_1.global_position + Vector2((randi_range(-100,100)),0)
					bullet.rotation = spawn2_1.global_rotation + 185.5
					get_tree().root.add_child(bullet)
			
				elif random == 3:
					bullet.position = spawn3_1.global_position  + Vector2(0,(randi_range(-300,300)))
					bullet.rotation = spawn3_1.global_rotation
					get_tree().root.add_child(bullet)
			
				elif random == 4:
					bullet.position = spawn4.global_position + Vector2(0,(randi_range(-300,300)))
					bullet.rotation = spawn4.global_rotation + 84.85
					get_tree().root.add_child(bullet)
		elif pattern_fight == 3 or pattern_fight == 4:
			var bullet = Bullet_scene.instantiate()
			for i in range(1,12,1): #Voir si on peut utiliser un switch ça peut optimiser le code et la rapidité
				var random = (randi_range(1,7))
				if random == 1:
					bullet.position = spawn1_2.global_position + Vector2((randi_range(-100,100)),0)
					bullet.rotation = spawn1_2.global_rotation - 89.52
					get_tree().root.add_child(bullet)
			
				elif random == 2:
					bullet.position = spawn1_3.global_position + Vector2((randi_range(-100,100)),0)
					bullet.rotation = spawn1_3.global_rotation - 89.52
					get_tree().root.add_child(bullet)
			
				elif random == 3:
					bullet.position = spawn2_2.global_position  + Vector2(0,(randi_range(-300,300)))
					bullet.rotation = spawn2_2.global_rotation + 84.85
					get_tree().root.add_child(bullet)
			
				elif random == 4:
					bullet.position = spawn2_3.global_position + Vector2(0,(randi_range(-300,300)))
					bullet.rotation = spawn2_3.global_rotation + 84.85
					get_tree().root.add_child(bullet)
				elif random == 5:
					bullet.position = spawn3_2.global_position + Vector2(0,(randi_range(-300,300)))
					bullet.rotation = spawn3_2.global_rotation
					get_tree().root.add_child(bullet)
				elif random == 6:
					bullet.position = spawn3_3.global_position + Vector2(0,(randi_range(-300,300)))
					bullet.rotation = spawn3_3.global_rotation
					get_tree().root.add_child(bullet)
				elif random == 7:
					bullet.position = spawn1_4.global_position + Vector2(0,(randi_range(-300,300)))
					bullet.rotation = spawn1_4.global_rotation - 89.52#Mettre les valeurs de rotations pour que ça tire vers le bas et pour celles de gauche que ça tire vers la droite
					get_tree().root.add_child(bullet)

func enemy_hit( ):
	health -= 1
	AnimationBoss.play("hit")
	if health == 900:
		Mod = 2
		Mod_Timer.start()
	if health == 0:
		Global.score +=5000
		queue_free()

func _on_pattern_timeout():
	pattern_fight = randi_range(1,5)

func _on_animation_player_animation_finished(Spawn):
	Global.FIGHT = 1

func _on_mod_timeout():
	if random_move == 1:
		random_move = 2
	elif random_move == 2:
		random_move = 1
