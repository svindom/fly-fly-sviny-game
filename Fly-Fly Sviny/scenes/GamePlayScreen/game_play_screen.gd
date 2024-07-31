extends Node2D

var reset_score_value: int = 0

# Preloading the Scene
const ROCK_OBSTACLES_SCENE_PATH: String = "res://scenes/RockObstacles/rock_obstacles.tscn"
@onready var rock_obstacles_scene_reference: PackedScene = preload(ROCK_OBSTACLES_SCENE_PATH)

# Node references
@onready var rocks_holder: Node = $RocksHolder
@onready var spawn_rocks_timer: Timer = $SpawnRocksTimer
@onready var spawn_marker_upper: Marker2D = $SpawnMarkerUpper
@onready var spawn_marker_lower: Marker2D = $SpawnMarkerLower



# Called when the node enters the scene tree for the first time.
func _ready():
	reset_score_on_start(reset_score_value)
	
	# This Signal is emited in the Sviny script in the destroy_sviny() func
	SignalManager.on_sviny_destroyed.connect(call_destroy_sviny)
	spawn_rock_obstacles()


# Called "SpawnRocksTimer" Timer
func _on_spawn_rocks_timer_timeout():
	spawn_rock_obstacles()


func stop_rocks_move() -> void:
	# Stop moving Rocks by disabling the timer
	spawn_rocks_timer.stop()
	for rock in rocks_holder.get_children():    # the godot function to get all children
		rock.set_process(false) # Stop the _process function executing in the rock_obstacles script


func spawn_rock_obstacles() -> void:
	# Create instances of the scene
	var new_rock_obstacles_scene_instance = rock_obstacles_scene_reference.instantiate()
	# Variables for x and y axis 
	var x_axis_random_rock_position: float = spawn_marker_upper.position.x
	var y_axis_random_rock_position: float = get_random_y_axis()
	
	# Set a new position for the instance
	new_rock_obstacles_scene_instance.position = Vector2(x_axis_random_rock_position, y_axis_random_rock_position)
	# Add instance to the RocksHolder
	rocks_holder.add_child(new_rock_obstacles_scene_instance)


# Get Random position on y axis
func get_random_y_axis() -> float:
	var y_pos_random: float = randf_range(spawn_marker_upper.position.y, spawn_marker_lower.position.y)
	return y_pos_random


func call_destroy_sviny() -> void:
	stop_rocks_move()


func reset_score_on_start(score_value: int) -> void:
	ScoreManager.set_score(score_value)






