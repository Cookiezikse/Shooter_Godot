extends CharacterBody2D

var Bullet = preload("res://enemy_bullet.tscn")

var player = null
var canshoot = true

@export var speed = 1.5

@onready var postir = $PosTir

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		
func _physics_process(delta):
	velocity.y = speed
	velocity.x = 0
	if player:
		velocity = position.direction_to(player.position) * speed
		velocity.y = speed
	move_and_collide(velocity)

#------Il y a un pb car la fonction ne se lance meme pas
#------Ok c'est bon il fallait le mettre en auto start sinon il ne marche pas automatiquement

func _on_atk_speed_timeout():
	canshoot = true 
	#print("Test canshoot")
	
	#-----La fonction ne marche pas, il n'y a pas de renvoi de valeurs 
	if player != null:
		#print("test player and shoot")
		shoot()

func shoot():
	if canshoot:
		var bullet = Bullet.instantiate()
		bullet.position = postir.global_position
		get_parent().add_child(bullet)
		
		$AtkSpeed.start()
		canshoot = false

