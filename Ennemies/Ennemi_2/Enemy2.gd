extends CharacterBody2D

var Bullet = preload("res://Ennemies/enemy_bullet.tscn")
var Explosion = preload("res://Autres/Explosion.tscn")
var Player_pos #Faire une variable qui a les coordonnées du player
var player = null
var canshoot = true

@export var speed = 3.5
@export var health = 2

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		
func _on_area_2d_body_exited(body):
	player = null
	
func _on_area_2d_2_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit( )
		queue_free( )
		
func _physics_process(delta):
	velocity.y = speed
	if player && velocity.y > 0:
		velocity = position.direction_to(player.position) * speed
	move_and_collide(velocity)
	if Global.grenade1 >= 0 && Input.is_action_pressed("grenade1"): 
		Global.score += 50
		var explosion = Explosion.instantiate()
		explosion.global_position = global_position
		get_tree().current_scene.add_child(explosion)
		queue_free()
		
func enemy_hit( ):
	health -= 1
	if health == 0:
		Global.score += 75
		var explosion = Explosion.instantiate()
		explosion.global_position = global_position
		get_tree().current_scene.add_child(explosion)
		queue_free()

	if health <= 0:
		var explosion = Explosion.instantiate()
		explosion.global_position = global_position
		get_tree().current_scene.add_child(explosion)
