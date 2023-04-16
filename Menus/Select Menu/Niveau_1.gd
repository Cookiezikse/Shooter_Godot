extends Area2D

var player = false

func _on_area_entered(area):
	player = true

func _process(delta):
	if player:
		if Input.is_action_pressed("ui_accept"):
			emit_signal("script_changed")
			Global.Scene_story = "res://Niveaux/Story/Niveaux1.tscn"
			get_tree().change_scene_to_file("res://Niveaux/Story/Niveaux1.tscn")
