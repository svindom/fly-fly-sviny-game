extends Control

@onready var game_over_timer: Timer = $GameOverTimer
@onready var score_value: Label = $GameOverScreenContainer/MarginContainer/VBoxContainer/Score



# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_sviny_destroyed.connect(on_sviny_destroyed)
	


func _on_game_over_timer_timeout():
	GameManager.load_main_scene()


func on_sviny_destroyed() -> void:
	game_over_timer.start()
	show_high_score()
	show()

func show_high_score() -> void:
	score_value.text = str(ScoreManager.get_high_score())
