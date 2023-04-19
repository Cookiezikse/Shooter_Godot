extends Node2D

# Faire un script pour choisir des config, en mode avec rotate speed = 100, spawn point = 4 
# Config 1 : rotate speed = 50 shoot timer wait time = 0.2 spawn point count = 6
# Config 2 : rotate speed = 100 shoot timer wait time = 0.1 ou 0.2 spawn point count = 8
# Config 3 : rotate speed = 75 shoot timer wait time = 0.2 spawn point count 12
# Config 4 : Les balles se tirent en cloche en suivant une fonction

const Bullet_scene = preload("res://Ennemies/Boss1/bullet_boss.tscn")
@onready var shoot_timer = $ShootTimer
@onready var rotater = $Rotater

const shooter_timer_wait_time = 0.2
const spawn_point_count = 12
const radius = 70
var health = 50

func _ready():
	var step = 2 * PI / spawn_point_count
	
	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
	
	shoot_timer.wait_time = shooter_timer_wait_time
	shoot_timer.start()
	
func _process(delta: float) -> void:
	var rotate_speed = randi_range(20,100)
	var new_rotation = rotater.rotation_degrees + rotate_speed * delta
	rotater.rotation_degrees = fmod(new_rotation, 360)
	
func _on_shoot_timer_timeout() -> void:
	for s in rotater.get_children():
		var bullet = Bullet_scene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation

func enemy_hit( ):
	health -= 1
	if health == 0:
		Global.score +=5000
		Global.grenade1+=1
		Global.Boss_amelioration = 0
		queue_free()
