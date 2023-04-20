extends Node2D

const speed = 300

@onready var Collision = $Area2D/CollisionShape2D

func _process(delta):
	position += transform.x * speed * delta
	if Global.Game_Over == true:
		Collision.disabled = true
	if Global.grenade1 >= 0 && Input.is_action_pressed("grenade1"): 
		queue_free()

func _on_death_timer_timeout():
	queue_free()

func _on_area_2d_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit( )
		queue_free( )

