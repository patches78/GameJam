extends Node2D

func _input(_event):
	if Input.is_action_just_pressed("Enter"):
		print("Enter gedrückt!")
		get_tree().change_scene_to_file("res://scenes/root.tscn")
