extends CharacterBody2D

# Faire un script pour choisir des config, en mode avec rotate speed = 100, spawn point = 4 
# Config 1 : rotate speed = 50 shoot timer wait time = 0.2 spawn point count = 6
# Config 2 : rotate speed = 100 shoot timer wait time = 0.1 ou 0.2 spawn point count = 8
# Config 3 : rotate speed = 75 shoot timer wait time = 0.2 spawn point count 12
# Config 4 : Les balles se tirent en cloche en suivant une fonction

const Bullet_scene = preload("res://Ennemies/Boss3/bullet_boss3.tscn")
const speed = 20
var pattern = 1

@onready var shoot_timer = $ShootTimer
@onready var rotater = $Rotater
@onready var AnimationBoss = $AnimationPlayer

@onready var spawn1_1 = $HD1

@onready var spawn2_1 = $HG1

@onready var spawn3_1 = $BD1

@onready var spawn4 = $BG1

var shooter_timer_wait_time = EnnemiVars.Speed_atk_Boss_FIN
var health = EnnemiVars.Health_Boss_FIN

func _ready():
	shoot_timer.wait_time = shooter_timer_wait_time 
	shoot_timer.start()
	
var random = 1

@onready var Cow = $AnimationPlayer

func _on_shoot_timer_timeout() -> void:
	var bullet = Bullet_scene.instantiate()
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

func enemy_hit( ):
	health -= 1
	AnimationBoss.play("hit")
	if health == 0:
		Global.score +=5000
		queue_free()

func _on_pattern_timeout():
	pass
	#pattern = randi_range(1,5)
