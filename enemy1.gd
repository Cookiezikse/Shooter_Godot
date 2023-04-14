extends CharacterBody2D

var Bullet = preload("res://enemy_bullet.tscn")
var Explosion = preload("res://Explosion.tscn")
var player = null
var canshoot = true

@export var speed = 1.2
@export var health = 3

@onready var postir = $PosTir
@onready var muzzleflash = $Muzzleflash

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		player = true
		
func _on_area_2d_body_exited(body):
	player = null

		
func _physics_process(delta):
	velocity.y = speed
	velocity.x = 0
	if player:
		velocity.y = speed
	move_and_collide(velocity)

func _on_atk_speed_timeout():
	canshoot = true 
	
	if player != null:
		shoot()

func shoot():
	if canshoot:
		var bullet = Bullet.instantiate()
		bullet.position = postir.global_position
		get_parent().add_child(bullet)
		
		muzzleflash.play("Muzzleflash")
		$AtkSpeed.start()
		canshoot = false
		
func enemy_hit( ):
	health -= 1
	if health == 0:
		Global.score +=50
		queue_free()

	if health == 0:
		var explosion = Explosion.instantiate()
		explosion.global_position = global_position
		get_tree().current_scene.add_child(explosion)
