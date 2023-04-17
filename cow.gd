extends CharacterBody2D

const SPEED = 20
var random = 1

@onready var Cow = $AnimationPlayer

func _physics_process(delta):

	if random == 1:
		velocity.x = 0
		Cow.play("Idle_cow")

	if random == 2:
		velocity.x = -SPEED
		get_node("Sprite2D").set_flip_h (true)
		Cow.play("Run_cow")

	if random == 3:
		velocity.x = SPEED
		get_node("Sprite2D").set_flip_h (false)
		Cow.play("Run_cow")


	move_and_slide()

func _on_timer_timeout():
	print(random)
	random = (randi() %3 + 1)
