extends Node2D

@onready var label = $CanvasLayer/QuitHint

func _input(_event):
	if Input.is_action_just_pressed("enter"):
		print("Enter gedrückt!")
		get_tree().quit()
