extends ParallaxBackground

var scroll_speed_bg: float = GameManager.scroll_speed



# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_sviny_destroyed.connect(stop_parallax_bg_move)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_parallax_bg_offset(delta)


func move_parallax_bg_offset(delta) -> void:
	scroll_offset.x -= scroll_speed_bg * delta 


func stop_parallax_bg_move() -> void:
	set_process(false) # Stop the _process function executing here
