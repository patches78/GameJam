extends Area2D

@onready var game_manager = $"../GameManager"
@onready var player = $"../Player"

func _on_body_entered(body) -> void:
	if (body.name == "Player" and game_manager.item_collected == 0):
		player.JUMP_VELOCITY -= 75
		print("Wow I'm now stronger than every mushroom.")
		# disablen für weiteres Spiel
		game_manager.gain_ability()
