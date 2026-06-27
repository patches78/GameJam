extends Node2D

func _input(_event):
	if Input.is_action_just_pressed("enter"):
		print("Enter gedrückt!")
		# benötigt globales für jedes level -> sowas wie reload last scene oder so
		get_tree().change_scene_to_file("res://scenes/level1.tscn")
