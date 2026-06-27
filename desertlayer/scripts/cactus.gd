extends Area2D


func _on_body_entered(body: Node2D) -> void:
	# save the level
	GlobalManager.current_level_path = get_tree().current_scene.scene_file_path
	
	if (body.name == "Player"):
		print("You died.")
		await get_tree().create_timer(GlobalManager.death_timeout).timeout
		get_tree().change_scene_to_file("res://scenes/died.tscn")
