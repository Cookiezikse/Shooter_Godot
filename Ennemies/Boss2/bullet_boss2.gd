extends CharacterBody2D

const speed = 300.0
const teta = 70.0
var time = 0
var timer = 0
var gauche = true
var droite = false
var count = 0
var count2 = 0

func _process(delta):
	#position.x += (-9.81*(delta*delta))/2 + speed * sin(teta)
	#position.y += 9.81 * delta
	velocity.y = speed 
	position.x = sin(position.y*0.02)*250+300


	move_and_slide()
	look_at(velocity)
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
