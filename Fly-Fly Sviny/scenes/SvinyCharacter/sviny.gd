extends CharacterBody2D


@export var gravity: float = 80.0
@export var up_player_forse: float = -25.0

@onready var sviny_idle_fly_frame_animation: AnimatedSprite2D = $SvinyIdleFlyFrameAnimation
@onready var up_force_animation: AnimationPlayer = $UpForceAnimation
@onready var bubble_particles:GPUParticles2D = $BubbleParticles

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	add_gravity_to_sviny(delta)
	add_up_move_to_fly()
	destroy_sviny_on_ground()
	move_and_slide() # this applies the velocity to the character's position (moves a character)



# To stop the Sviny animation and to stop invoking its physics
func destroy_sviny() -> void:
	sviny_idle_fly_frame_animation.stop() # stop frame animation
	set_physics_process(false) # disable physics process


# Destroy Sviny when it is on the ground
func  destroy_sviny_on_ground() -> void:
	if is_on_floor() == true:
		destroy_sviny()
		bubble_particles.emitting = false # stop emitting particles



func add_gravity_to_sviny(delta) -> void:
	velocity.y += gravity * delta

func add_up_move_to_fly() -> void:
	# When the space key is pressed
	if Input.is_action_just_pressed("up_force") == true:
		velocity.y = up_player_forse
		up_force_animation.play("sviny_up_force_animation") # Add the animation name
