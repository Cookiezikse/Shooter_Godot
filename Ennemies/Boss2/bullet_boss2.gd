extends CharacterBody2D

const speed = 300.0
const teta = 70.0
var time = 0
var timer = 0
var gauche = true 
var droite = false
var count = 0
var count2 = 0
var Vector = Vector2(0,velocity.x) 
var random = (randi_range(1,2))
var random2 = (randi_range(1,2))
var CHOISIR = 1

@onready var Collision = $Area2D/CollisionShape2D

func _process(delta):
	#position.x += (-9.81*(delta*delta))/2 + speed * sin(teta)
	#position.y += 9.81 * delta

	if CHOISIR == 1:
		if random2 == 1:
			if random == 1:
				velocity.y = speed - 150
				position.x = sin((position.y)*0.02)*400
			if random == 2:
				velocity.y = speed - 200
				position.x = sin((position.y)*0.02)*400 + 600
		if random2 == 2:
			if random == 1:
				velocity.y = speed - 150
				position.x = cos((position.y)*0.02)*400
			if random == 2:
				velocity.y = speed - 200
				position.x = cos((position.y)*0.02)*400 + 600
			
		velocity.y = speed - 200
	if CHOISIR == 2:
		velocity.y = speed 
		position.x += sin(position.y/150)*5
	
	move_and_slide()
	if Global.Game_Over == true:
		Collision.disabled = true
		
	look_at(Vector)
	if Global.grenade1 >= 0 && Input.is_action_pressed("grenade1"): 
		queue_free()

func _on_death_timer_timeout():
	queue_free()

func _on_area_2d_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit( )
		queue_free( )

func _on_timer_timeout():
	time +=4
