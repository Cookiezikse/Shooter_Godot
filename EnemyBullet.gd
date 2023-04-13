extends Area2D

var speed = 400
#La fonction ne marchait pas car il n'y avait pas de 's' à physics
func _physics_process(delta):
	position.y += delta * speed
