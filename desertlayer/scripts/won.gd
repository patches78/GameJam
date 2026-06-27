extends Node2D

@onready var label = $CanvasLayer/QuitHint

@onready var won_sound = $Won_Sound	

func _input(_event):
	won_sound.play()
	if Input.is_action_just_pressed("Enter"):
		print("Enter gedrückt!")
		get_tree().quit()
