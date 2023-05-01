extends Node2D

var Enemy2 = preload("res://Ennemies/Ennemi_2/Enemy2.tscn")
var random = 0

@onready var Music = $AudioStreamPlayer

func _ready():
	Global.The_END = 1
	Global.speed2 = 1
	Global.score = 0
	Global.amelioration = 0

func _on_spawn_timeout():
	var enemy2 = Enemy2.instantiate()
	add_child(enemy2)
	enemy2.position = Vector2(randi_range(2,580),randi_range(-5,-5))

func _on_timer_timeout():
	Global.Niveau2_clear = true
	Global.The_END = 0
	Global.speed2 = 0
	get_tree().change_scene_to_file("res://Menus/Select Menu/select_menu1.tscn")


func _on_audio_stream_player_finished():
	Music.play()
