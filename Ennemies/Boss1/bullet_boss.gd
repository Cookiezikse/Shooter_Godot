extends Node2D

const speed = 200

func _process(delta):
	position += transform.x * speed * delta

func _on_death_timer_timeout():
	queue_free()

func _on_area_2d_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit( )
		queue_free( )

