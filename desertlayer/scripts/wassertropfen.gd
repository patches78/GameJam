extends Area2D

@onready var player: CharacterBody2D = $"../Player"
@onready var w_sound = $Water_Sound

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Player"):
		print("Wow water.")
		# Need it for the sound, otherwise queue_free blocks it 
		
		# Hide so it looks collected immediately
		$Sprite2D.hide() 
		# Disable collision so it can't be collected twice
		$CollisionShape2D.set_deferred("disabled", true) 
		player.getHydrated()
		w_sound.play()
		
		# Wait for the sound to finish playing
		await get_tree().create_timer(1.0).timeout
		
		queue_free()
