extends Control

@onready var score_value: Label = $UIMarginContainer/ScoreMarginContainer/HBoxContainer/ScoreValue



# Called when the node enters the scene tree for the first time.
func _ready():
	set_score_on_main_screen()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	enter_game_screen() 


func set_score_on_main_screen() -> void:
	score_value.text = str(ScoreManager.get_score())


func enter_game_screen() -> void:
	if Input.is_action_just_pressed("press_enter_to_play") == true:
		GameManager.load_game_play_scene()

