extends Control

var P2 = preload("res://Player2/Player2.tscn")
@onready var P22 = $Player2

func _on_JOUEURS():
	if Global.P2_dead == 0:
		var P2_spawn = P2.instantiate()
		get_tree().root.add_child(P2_spawn)
		


func _on_niveau_1_script_changed():
	pass
	#P22.queue_free()
