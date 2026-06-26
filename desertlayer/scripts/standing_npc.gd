extends CharacterBody2D

var mm_awaken = false

@onready var animated_sprite = $AnimatedSprite2D
@onready var game_manager = $"../GameManager"

func _on_hitbox_body_entered(body) -> void:
	if (body.name == "Player" and mm_awaken == false):
		print("MushroomMaster awakes.")
		# darf nur 1x passieren
		mm_awaken = true
		game_manager.awake_mushroom_master()
		animated_sprite.play("awake")
