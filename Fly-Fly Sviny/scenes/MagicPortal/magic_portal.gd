extends Area2D

@onready var portal_turn_off_animation: AnimationPlayer = $PortalTurnOffAnimation


func _on_body_entered(body):
	if body.is_in_group(GameManager.SVINY_GROUP_NAME):
		play_turn_off_animation()

func play_turn_off_animation() -> void:
	portal_turn_off_animation.play("portal_turn_off")
