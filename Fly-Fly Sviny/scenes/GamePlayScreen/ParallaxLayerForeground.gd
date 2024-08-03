extends ParallaxLayer

@onready var sprite_2d: Sprite2D = $Sprite2D

var texture_size_x_axis: float = 6750.0
var texture_size_y_axis: float = 1080.0



# Called when the node enters the scene tree for the first time.
func _ready():
	set_image()
	show()


func set_image() -> void:
	var scale_factor: float = get_viewport_rect().size.y / texture_size_y_axis
	sprite_2d.scale = Vector2(scale_factor, scale_factor)
	motion_mirroring.x = texture_size_x_axis * scale_factor
