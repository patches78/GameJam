extends CharacterBody2D

const SPEED = 25
@onready var animated_sprite = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down_left: RayCast2D = $RayCastDownLeft
@onready var ray_cast_down_right: RayCast2D = $RayCastDownRight
#@onready var d_sound = $"../../Music/Died_Sound"
var direction = 1 # standardmäßig nach rechts

func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# links ist ne Wand oder an Kante (von rechts gekommen)
	if ray_cast_left.is_colliding() or (not ray_cast_down_left.is_colliding() and direction == -1):
		direction = 1
		animated_sprite.play("go_right")
	# rechts ist ne Wand oder an Kante (von links gekommen)
	if ray_cast_right.is_colliding() or (not ray_cast_down_right.is_colliding() and direction == 1):
		direction = -1
		animated_sprite.play("go_left")
	# ohne delta bewegt sich Gegner unregelmäßig
	position.x += direction * delta * SPEED # n pixel pro frame

	move_and_slide() # sonst fktiert die gravity nicht

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
