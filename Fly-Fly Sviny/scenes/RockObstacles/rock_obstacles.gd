extends Node2D

@export var scroll_speed: float = GameManager.scroll_speed


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	move_rocks(scroll_speed, delta)


func move_rocks(speed: float, delta) -> void:
	position.x -= speed * delta


func _on_screen_exited():
	queue_free() # delete this object
	print("DELETED")
