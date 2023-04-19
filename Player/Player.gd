extends CharacterBody2D

var Bullet = preload("res://Player/player_bullet.tscn")

const SPEED = 300.0
var health = 1
var canshoot = true
var amelioration = 0
var canscoop = true

@onready var Noscoop = $Noscoopie
@onready var spawnpos = $SpawnPos
@onready var spawnpos2 = $SpawnPos2
@onready var muzzleflash1 = $Muzzleflash1_2
@onready var muzzleflash2 = $Muzzleflash2_2
@onready var Godmod = $CollisionPolygon2D
@onready var Nohit = $CollisionPolygon2D
@onready var ScoopTimer = $ScoopTimer

@warning_ignore("unused_parameter")

func _physics_process(delta):
	var horizontale = Input.get_axis("ui_left", "ui_right") 
	var verticale = Input.get_axis("ui_up", "ui_down")
	if Input.is_action_pressed("ui_focus_next"):
		Godmod.disabled = true
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
	
	if Global.grenade1 >= 0 && Input.is_action_just_pressed("grenade1"):
		Global.grenade1 -= 1

	move_and_slide()

func _on_shoot_speed_timeout():
	canshoot = true 

func _process(delta):
	if Input.is_action_pressed("Noscoop") && canscoop:
		Noscoop.play("Nscoop")
		Nohit.disabled = true
		canscoop = false
		ScoopTimer.start()
	
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
	if Global.amelioration == 1:
		var bullet2 = Bullet.instantiate()
		bullet2.position = spawnpos2.global_position
		get_tree().current_scene.add_child(bullet2)
		muzzleflash2.queue("Muzzleflash2")
		$ShootSpeed.start()
		canshoot = false

func player_hit( ):
	health -= 1
	if health >= 0:
		Global.P1_dead = 1
		if Global.P1_dead == 1 && Global.P2_dead == 1 && Global.P3_dead == 1 && Global.P4_dead == 1:
			get_tree( ).change_scene_to_file("res://Menus/Game Over/gameovermenu.tscn")
		queue_free()

func _on_noscoopie_animation_finished(anim_name):
	Nohit.disabled = false


func _on_scoop_timer_timeout():
	canscoop = true
