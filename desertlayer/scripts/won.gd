extends Node2D

@onready var label = $CanvasLayer/QuitHint

# prüfen, ob Spieler alle Münzen gesammelt hat
func _ready():
	#Todo: wird noch nicht korrekt angezeigt, wenn mn gewinnt 
	if GlobalGameManager.global_coins == GlobalGameManager.global_maxcoins:
		label.text = "and you collected all Coins!\n\n" + label.text
	else:
		label.text = "but you didn't collect all Coins.\n\n" + label.text

func _input(_event):
	if Input.is_action_just_pressed("Enter"):
		print("Enter gedrückt!")
		get_tree().quit()
