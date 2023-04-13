extends ParallaxBackground

@export var speed : int
@onready var background = $WaterBackground

#Background qui marche, on peut changer la vitesse du scroll avec la variable export speed
func _process(delta):
	scroll_base_offset -= Vector2(0,-speed) * delta
func _ready():
	background.motion_mirroring.y = 100
