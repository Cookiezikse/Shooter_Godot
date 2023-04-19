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
@onready var spawn1 = $Marker2D 

var shooter_timer_wait_time = EnnemiVars.Speed_atk_Boss_1 
var spawn_point_count = EnnemiVars.Spawn_point_Boss_1 
const radius = 70
var health = EnnemiVars.Health_Boss_1

func _ready():
	shoot_timer.wait_time = shooter_timer_wait_time 
	shoot_timer.start()

func _process(delta: float) -> void:
	pass
	
func _on_shoot_timer_timeout() -> void:

	var bullet = Bullet_scene.instantiate()
	bullet.position = spawn1.global_position
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
