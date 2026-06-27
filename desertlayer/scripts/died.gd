extends Node2D

func _input(_event):

	if Input.is_action_just_pressed("Enter"):
		print("Enter gedrückt!")
		# Check if we actually have a level 
		if GlobalManager.current_level_path != "":
			get_tree().change_scene_to_file(GlobalManager.current_level_path)
		else:
			# Fallback 
			get_tree().change_scene_to_file("res://scenes/level1.tscn")
