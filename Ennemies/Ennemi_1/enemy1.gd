extends CharacterBody2D

var Bullet = preload("res://Ennemies/enemy_bullet.tscn")
var Explosion = preload("res://Autres/Explosion.tscn")
var player = null
var canshoot = true
var amount_grenade = 3

@export var speed = 1.2
var health = EnnemiVars.Health_Ennemi_1

@onready var postir = $PosTir
@onready var muzzleflash = $Muzzleflash

func _process(delta):
	if Input.is_action_pressed("grenade"):
		grenade()

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
	# Je l'ai mit en commentaire parce que flemme de chercker si le joueur est la, il tire et puis c'est tout
	#car y a des bug, si il apparait dedans direct il est pas compté et il tire pas
	#if player != null:
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
	if health <= 0:
		Global.score +=50
		queue_free()

	if health <= 0:
		var explosion = Explosion.instantiate()
		explosion.global_position = global_position
		get_tree().current_scene.add_child(explosion)
		
func grenade( ):
	if Input.is_action_pressed("grenade"):
		health -= 1
