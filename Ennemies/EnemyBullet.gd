extends Area2D

var speed = 400

func _physics_process(delta):
	position.y += delta * speed
	if Global.grenade1 >= 0 && Input.is_action_pressed("grenade1"): 
		queue_free()


func _on_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit( )
		queue_free( )


func _on_despawntimer_timeout():
	queue_free( )
