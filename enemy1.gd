extends CharacterBody2D

var Bullet = preload("res://EnemyBullet.gd")

var player = null
var canshoot = true

@export var speed = 1

@onready var postir = $PosTir

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		
func _physics_process(delta):
	velocity.y = 1
	
	if player:
		velocity = position.direction_to(player.position) * speed
	move_and_collide(velocity)

func _on_atk_speed_timeout():
	canshoot = true 
	if player != null:
		shoot()

func shoot():
	if canshoot:
		var bullet = Bullet.instanciate()
		bullet.position = postir.global_position
		get_parent().add_chirld(bullet)
		
		$AtkSpeed.start()
		canshoot = false

