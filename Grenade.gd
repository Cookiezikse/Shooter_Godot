extends Label

func _process(delta):
	if Global.grenade1 == -1:
		set_text(str(Global.grenade1 + 1))
	else :
		set_text(str(Global.grenade1))
