extends Node2D

@onready var Anim_fin = $After_boss/AnimationPlayer
@onready var timer_fin = $Timer_fin

var Enemy2 = preload("res://Ennemies/Ennemi_2/Enemy2.tscn")
var Boss_Fin = preload("res://Ennemies/Boss3/boss_3.tscn")
var random = 0
const count = 20
var Count = true
var Count2 = true

func _ready():
	Global.score = 0

func _on_spawn_timeout():
 #Pour aller plus vite sur le boss et sinon go mettre 1 pour les joueurs
	if Global.FIGHT == 1:
		var enemy = Enemy2.instantiate()
		add_child(enemy)
		enemy.position = Vector2(randi_range(2,580),randi_range(-5,-5))
	if Global.The_END == 1:
		if Count:
			var Boss = Boss_Fin.instantiate()
			Boss.position = Vector2(300,-50)
			get_tree().root.add_child(Boss)
			Count = false
	if Global.score > 4000 && Count2:
		timer_fin.wait_time = 2
		timer_fin.start()
		#print(timer_fin)  
		Global.FIGHT = 0
		Global.The_END = 0
		Count2 = false
		#lance les anims 
		#Ou faire un signal qui directement à l'anim quand le boss meurt

func _on_timer_fin_timeout():
	Anim_fin.play("Text1")

func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://Menus/Credits/Creditss.tscn")
