extends Area2D

@onready var game_manager = $"../GameManager"
@onready var w_sound = $"../Music/Win_Sound"
@onready var d_sound = $"Died_Sound"

func _on_body_entered(body) -> void:
	if (body.name == "Player"):
		if (game_manager.score == game_manager.max_coins):
			print("You win.")
			w_sound.play()
		else:
			print("You loose.")
			d_sound.play()
		#await get_tree().create_timer(GlobalGameManager.win_timeout).timeout
		get_tree().change_scene_to_file("res://scenes/won.tscn")
