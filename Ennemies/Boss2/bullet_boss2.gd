extends CharacterBody2D

const speed = 300.0
const teta = 70.0
var time = 0

func _process(delta):
	#position.x += (-9.81*(delta*delta))/2 + speed * sin(teta)
	#position.y += 9.81 * delta
	velocity.x = 9.81 * time + speed
	velocity.y = speed * cos(teta)
	move_and_slide()
	if Global.grenade1 >= 0 && Input.is_action_pressed("grenade1"): 
		queue_free()

func _on_death_timer_timeout():
	queue_free()

func _on_area_2d_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit( )
		queue_free( )



func _on_timer_timeout():
	time += 0.1
