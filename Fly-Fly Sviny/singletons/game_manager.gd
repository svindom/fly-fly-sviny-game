extends Node

const SVINY_GROUP_NAME: String = "sviny"
var scroll_speed: float = 150.0

var game_play_screen: PackedScene = preload("res://scenes/GamePlayScreen/game_play_screen.tscn")
var main_screen: PackedScene = preload("res://scenes/MainScreen/main_screen.tscn")
var game_over_screen: PackedScene = preload("res://scenes/GameOverScreen/game_over_screen.tscn")

func load_game_play_scene() -> void:
	get_tree().change_scene_to_packed(game_play_screen)


func load_main_scene() -> void:
	get_tree().change_scene_to_packed(main_screen)


func load_game_over_screen() -> void:
	get_tree().change_scene_to_packed(game_over_screen)
