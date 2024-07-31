extends Node

var _score: int = 0
var _high_score: int = 0
var _updated_score: int = 0



func get_score() -> int:
	return _score 


func set_score(score_value: int) -> void:
	_score = score_value
	print("Score is: ", _score)
	if _score > _high_score:
		_high_score = _score
		print("the new Score is: ", _high_score)
	
	SignalManager.on_score_updated.emit()


func get_high_score() -> int:
	return _high_score


func increment_score() -> void:
	_updated_score = _score + 1
	set_score(_updated_score)





