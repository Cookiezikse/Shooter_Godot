extends CharacterBody2D

# Faire un script pour choisir des config, en mode avec rotate speed = 100, spawn point = 4 
# Config 1 : rotate speed = 50 shoot timer wait time = 0.2 spawn point count = 6
# Config 2 : rotate speed = 100 shoot timer wait time = 0.1 ou 0.2 spawn point count = 8
# Config 3 : rotate speed = 75 shoot timer wait time = 0.2 spawn point count 12
# Config 4 : Les balles se tirent en cloche en suivant une fonction

const Bullet_scene = preload("res://Ennemies/Boss3/bullet_boss3.tscn")
@onready var shoot_timer = $ShootTimer
@onready var rotater = $Rotater
@onready var Hit = $AnimationPlayer

@onready var spawn1_1 = $HD1
@onready var spawn1_2 = $HD1/HD2
@onready var spawn1_3 = $HD1/HD3
@onready var spawn1_4 = $HD1/HD4
@onready var spawn1_5 = $HD1/HD5
@onready var spawn1_6 = $HD1/HD6
@onready var spawn1_7 = $HD1/HD7
@onready var spawn1_8 = $HD1/HD8
@onready var spawn1_9 = $HD1/HD9
@onready var spawn1_10 = $HD1/HD10
@onready var spawn1_11 = $HD1/HD11

@onready var spawn2_1 = $HG1
@onready var spawn2_2 = $HG1/HG2
@onready var spawn2_3 = $HG1/HG3
@onready var spawn2_4 = $HG1/HG4
@onready var spawn2_5 = $HG1/HG5
@onready var spawn2_6 = $HG1/HG6
@onready var spawn2_7 = $HG1/HG7
@onready var spawn2_8 = $HG1/HG8
@onready var spawn2_9 = $HG1/HG9
@onready var spawn2_10 = $HG1/HG10
@onready var spawn2_11 = $HG1/HG11

@onready var spawn3_1 = $BD1
@onready var spawn3_2 = $BD1/BD2
@onready var spawn3_3 = $BD1/BD3
@onready var spawn3_4 = $BD1/BD4
@onready var spawn3_5 = $BD1/BD5
@onready var spawn3_6 = $BD1/BD6
@onready var spawn3_7 = $BD1/BD7
@onready var spawn3_8 = $BD1/BD8

@onready var spawn4 = $BG1

var shooter_timer_wait_time = EnnemiVars.Speed_atk_Boss_1 -0.1
const radius = 70
var health = EnnemiVars.Health_Boss_1

func _ready():
	shoot_timer.wait_time = shooter_timer_wait_time 
	shoot_timer.start()

func _process(delta: float) -> void:
	pass
	
func _on_shoot_timer_timeout() -> void:
	var random = (randi_range(1,4))
	var bullet = Bullet_scene.instantiate()
	if random == 1:
		bullet.position = spawn1_1.global_position + Vector2((randi_range(-100,100)),0)
		bullet.rotation = -spawn1_1.global_rotation
	if random == 2:
		bullet.position = spawn2_1.global_position + Vector2((randi_range(-100,100)),0)
		bullet.rotation = spawn2_1.global_rotation + 185.5
	if random == 3:
		bullet.position = spawn3_1.global_position  + Vector2(0,(randi_range(-600,600)))
		bullet.rotation = spawn3_1.global_rotation
	if random == 4:
		bullet.position = spawn4.global_position + Vector2(0,(randi_range(-300,300)))
		bullet.rotation = spawn4.global_rotation + 84.85
	get_tree().root.add_child(bullet)

func enemy_hit( ):
	health -= 1
	Hit.play("hit")
	if health == 0:
		Global.score +=5000
		queue_free()

const SPEED = 20
var random = 1

func _physics_process(delta):
	if Global.Boss_amelioration == 1:
		EnnemiVars.Health_Boss_1 = 220
		if random == 1:
			velocity.x = -SPEED

		if random == 2:
			velocity.x = SPEED
		global_position.x = clamp(global_position.x, 25, 580)
		global_position.y = clamp(global_position.y, 40, 780)

		move_and_slide()

func _on_timer_timeout():
	random = (randi() %2 + 1)
