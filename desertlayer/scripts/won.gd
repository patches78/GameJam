extends Node2D

@onready var label = $CanvasLayer/QuitHint

#func _ready():
	

func _input(_event):
	if Input.is_action_just_pressed("Enter"):
		print("Enter gedrückt!")
		get_tree().quit()
