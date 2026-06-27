extends Area2D

#@onready var d_sound = $"../Music/Died_Sound"
# cast erzeugt Typumwandlungsfehler -> deshalb manuell überprüfen
func _on_body_entered(body) -> void:
	if (body.name == "Player"):
		print("You died.")
		#d_sound.play()
		await get_tree().create_timer(GlobalManager.death_timeout).timeout
		get_tree().change_scene_to_file("res://scenes/died.tscn")
