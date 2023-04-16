extends CharacterBody2D

var Bullet = preload("res://Ennemies/enemy_bullet.tscn")
var Player_pos #Faire une variable qui a les coordonnées du player
var player = null
var canshoot = true

@export var speed = 5
@export var health = 2

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		
func _on_area_2d_body_exited(body):
	player = null
		
func _physics_process(delta):
	velocity.y = speed
	if player && velocity.y > 0:
		velocity = position.direction_to(player.position) * speed
	move_and_collide(velocity)
	if Global.grenade1 > 0 && Input.is_action_pressed("grenade"):
		Global.grenade1 -= 1
		Global.score += 50
		queue_free()
	if Global.grenade2 > 0 && Input.is_action_pressed("grenade2"):
		Global.grenade2 -= 1
		Global.score += 50
		queue_free()
		
func enemy_hit( ):
	health -= 1
	if health == 0:
		Global.score += 75
		queue_free()
