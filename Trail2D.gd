extends Line2D

var longueur = 50
var point = Vector2()
	
func _process(delta):
	
	global_position=Vector2(0,0)
	global_rotation = 0
	
	point = get_parent().global.position
	
	add_point(point)
	while get_point_count()>longueur:
		remove_point(0)
