extends Area2D

#@onready var w_sound = $"../Music/Win_Sound"

func _on_body_entered(body) -> void:
	if (body.name == "Player"):
		print("You reached the end of level 1!")
		await get_tree().create_timer(GlobalManager.win_timeout).timeout
		get_tree().change_scene_to_file("res://scenes/level2.tscn")
