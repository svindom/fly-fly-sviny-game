extends Node2D

@export var scroll_speed: float = GameManager.scroll_speed

@onready var magic_portal: Area2D = $MagicPortal

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	move_rocks(scroll_speed, delta)


func move_rocks(speed: float, delta) -> void:
	position.x -= speed * delta


func _on_screen_exited():
	queue_free() # delete this object
	print("Rocks DELETED")


func _on_rock_obstacles_body_entered(body):
	if check_if_body_in_group(body) == true:
		print ("Sviny collides with rocks")
		body.destroy_sviny()


func _on_magic_portal_body_entered(body):
	if check_if_body_in_group(body) == true:
		print("Sviny collides with the portal")
		ScoreManager.increment_score()
		# Play the portal turn off animation
		if magic_portal and magic_portal.has_method("play_turn_off_animation"):
			magic_portal.play_turn_off_animation()



# Checking if an object is detected in the group, which we created in the Sviny Scene
# "GameManeger" is an Autoload(Singleton), which is available everywhere in the game 
# and it holds a group name of the body
func check_if_body_in_group(body) -> bool:
	var is_body_existed_in_group = false
	
	if body.is_in_group(GameManager.SVINY_GROUP_NAME) == true:
		is_body_existed_in_group = true
		return is_body_existed_in_group
	
	return is_body_existed_in_group





