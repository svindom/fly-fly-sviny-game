extends Control

@onready var score_text: Label = $MarginContainer/ScoreText



func _ready():
		# This Signal is emited in the score_manager script
	SignalManager.on_score_updated.connect(update_score_text)


func update_score_text() -> void:
	# "str" converts to String or casts like in C#
	# '.text' property for setting text to the label
	score_text.text = str(ScoreManager.get_score())
