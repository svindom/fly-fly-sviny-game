extends ParallaxLayer

@onready var sprite_2d = $Sprite2D

@export var new_texture: Texture
@export var motion_scroll_scale_speed: float = 0.0
@export var texture_size_x_axis: float = 6750.0
@export var texture_size_y_axis: float = 1080.0



# Called when the node enters the scene tree for the first time.
func _ready():
	set_parallax_motion_scale_speed()
	set_texture()


# Set the Motion.Scale in the ParallaxLayer (ParallaxScrollingLayer) inspector
# to set a different speed
func set_parallax_motion_scale_speed() -> void:
	motion_scale.x = motion_scroll_scale_speed


func set_texture() -> void:
	# get_viewport_rect function for getting size of a screen
	# The scale factor (scale_factor) adjusts the texture's dimensions to fit the viewport height.
	var scale_factor: float = get_viewport_rect().size.y / texture_size_y_axis
	
	# Setting a texture to an instance image
	sprite_2d.texture = new_texture
	# Setting a scale to an instance image based on a scale factor
	sprite_2d.scale = Vector2(scale_factor, scale_factor)
	# Setting the motion mirroring
	motion_mirroring.x = texture_size_x_axis * scale_factor






