extends ParallaxBackground

var scroll_speed: float = GameManager.scroll_speed


func  _ready():
	SignalManager.on_sviny_destroyed.connect(stop_parallax_move)


func _process(delta):
	scroll_paralax_bg(delta)


func scroll_paralax_bg(delta) -> void:
	scroll_offset.x -= delta * scroll_speed


func stop_parallax_move() -> void:
	set_process(false)
