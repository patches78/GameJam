extends CharacterBody2D

const SPEED = 25
@onready var animated_sprite = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
#@onready var d_sound = $"../../Music/Died_Sound"
var direction = 1 # standardmäßig nach rechts

func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# links ist ne Wand
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.play("fly_right")
	# rechts ist ne Wand
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.play("fly_left")
	# ohne delta bewegt sich Gegner unregelmäßig
	position.x += direction * delta * SPEED # n pixel pro frame

func _on_killbox_body_entered(body) -> void:
	# print zum bst von body-names
	#print(body.name)
	if (body.name == "Player"):
		#d_sound.play()
		print("Du trocknest aus.")
		#Todo: fehlt noch Rest

		#var y_delta = position.y - body.position.y
		#var x_delta = body.position.x - position.x
		#if(y_delta > 0):
		#	print("Destroy enemy")
		#	queue_free()
