extends Control

@onready var game_over_timer: Timer = $GameOverTimer
@onready var game_over_popup_animation: AnimationPlayer = $GameOverPopupAnimation

func _ready():
	hide()
	SignalManager.on_sviny_destroyed.connect(on_sviny_destroyed)


func _on_game_over_timer_timeout():
	GameManager.load_main_scene()


func on_sviny_destroyed() -> void:
	game_over_timer.start()
	game_over_popup_animation.play("game_over_popup_animation")
	show()
	
