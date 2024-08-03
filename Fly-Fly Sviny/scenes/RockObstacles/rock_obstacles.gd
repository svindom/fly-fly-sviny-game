extends Node2D

var scroll_speed: float = GameManager.scroll_speed

@onready var magic_portal: Area2D = $MagicPortal
@onready var portal_pass_sound: AudioStreamPlayer2D = $PortalPassSound


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
		# Play the portal pass sound
		portal_pass_sound.play()
		# Play the portal turn off animation
		check_and_play_portal_off_animation() 


func check_and_play_portal_off_animation() -> void:
	if magic_portal and magic_portal.has_method("play_turn_off_animation") == true:
		magic_portal.play_turn_off_animation()
	else:
		print("Warning: 'play_turn_off_animation' method not found on magic_portal")
		print("Or the magic_portal node doesn't exist")


# Checking if an object is detected in the group, which we created in the Sviny Scene
# "GameManeger" is an Autoload(Singleton), which is available everywhere in the game 
# and it holds a group name of the body
func check_if_body_in_group(body) -> bool:
	var is_body_existed_in_group = false
	
	if body.is_in_group(GameManager.SVINY_GROUP_NAME) == true:
		is_body_existed_in_group = true
		return is_body_existed_in_group
	
	return is_body_existed_in_group





