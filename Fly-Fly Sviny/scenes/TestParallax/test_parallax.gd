extends Node2D

@export var speed_move: float = 80.0
@onready var parallax_background: ParallaxBackground = $ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	move_with_parallax_bg_offset(delta)



func move_with_parallax_bg_offset(delta: float) -> void:
	parallax_background.scroll_offset.x -= speed_move * delta
	print("Parallax offset: ", parallax_background.scroll_offset.x)
