extends Area2D

@onready var game_manager = $"../../GameManager"

func _ready():
	game_manager.register_coins()

func _on_body_entered(body) -> void:
	if (body.name == "Player"):
		print("Wow a coin.")
		game_manager.collect_coin()
		# removes from game
		queue_free()
