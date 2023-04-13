extends CharacterBody2D

var Bullet = preload("res://player_bullet.tscn")

const SPEED = 300.0
var canshoot = true
var amelioration = 0

@onready var spawnpos = $SpawnPos
@onready var spawnpos2 = $SpawnPos2
@onready var muzzleflash1 = $Muzzleflash1_2
@onready var muzzleflash2 = $Muzzleflash2_2

@warning_ignore("unused_parameter")
func _physics_process(delta):
	var horizontale = Input.get_axis("ui_left", "ui_right") 
	var verticale = Input.get_axis("ui_up", "ui_down")
	
	#direction horizontale
	if horizontale == 1:
		velocity.x = horizontale * SPEED 
	elif horizontale == -1:
		velocity.x = horizontale * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#direction verticale
	if verticale:
		velocity.y = verticale * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	global_position.x = clamp(global_position.x, 25, 580)
	global_position.y = clamp(global_position.y, 40, 780)

	move_and_slide()

func _on_shoot_speed_timeout():
	canshoot = true 

func _process(delta):
	if Input.is_action_pressed("shoot") and canshoot:
		shoot()
		
func shoot():
	
	#SpawnPos1
	var bullet = Bullet.instantiate()
	bullet.position = spawnpos.global_position
	get_tree().current_scene.add_child(bullet)
	muzzleflash1.play("Muzzleflash1")
	$ShootSpeed.start()
	canshoot = false
	
	#SpawnPos2
	if amelioration == 1:
		var bullet2 = Bullet.instantiate()
		bullet2.position = spawnpos2.global_position
		get_tree().current_scene.add_child(bullet2)
		muzzleflash2.queue("Muzzleflash2")
		$ShootSpeed.start()
		canshoot = false

