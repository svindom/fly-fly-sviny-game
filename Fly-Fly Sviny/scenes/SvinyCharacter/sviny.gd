extends CharacterBody2D


@export var gravity: float = 80.0
@export var up_player_forse: float = -25.0

@onready var sviny_idle_fly_frame_animation: AnimatedSprite2D = $SvinyIdleFlyFrameAnimation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	add_gravity_to_sviny(delta)
	add_up_move_to_fly()


func add_gravity_to_sviny(delta) -> void:
	velocity.y += gravity * delta
	move_and_slide() # this applies the velocity to the character's position (moves a character)

func add_up_move_to_fly() -> void:
	# When the space key is pressed
	if Input.is_action_just_pressed("up_force") == true:
		velocity.y = up_player_forse
