extends Area2D

var speed = 400

func _physic_proceess(delta):
	position.x -= delta * speed
