extends ParallaxBackground

@export var speed : int
@onready var background = $WaterBackground
@onready var background2 = $MapBackground

#Background qui marche, on peut changer la vitesse du scroll avec la variable export speed
func _process(delta):
	scroll_base_offset -= Vector2(0,-200) * delta
func _ready():
	background.motion_mirroring.y = 100 #Ne pas changer cette valeur (normalement)
	background2.motion_mirroring.y = 1000 #Changer cette valeur si on agrandi la map derriere
