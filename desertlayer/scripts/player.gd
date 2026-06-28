extends CharacterBody2D

@onready var player: CharacterBody2D = $"."

const SPEED = 100.0
var JUMP_VELOCITY = -200.0

const maxWater = 100.0
var curWater = 100.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var j_sound = $Jump_Sound

func _physics_process(delta: float) -> void:
	if curWater > 0:
		# get direction input {-1,0,1}
		# Todo: ka warum, aber die Shortcuts mit left & right fktieren nicht mehr
		var direction := Input.get_axis("left","right")

		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
			if direction > 0:
				animated_sprite.play("jump_right") # jump & move right
			elif direction < 0:
				animated_sprite.play("jump_left") # jump & move left
			else:
				animated_sprite.play("jump_idle") # jump
		else:
			if direction > 0:
				animated_sprite.play("go_right") # !jump & move right
			elif direction < 0:
				animated_sprite.play("go_left") # !jump & move right
			else:
				animated_sprite.play("idle") # # !jump & dont move

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			j_sound.play()

		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
	else:
		animated_sprite.play("dead")
		print("Oops. You died of thirst.")
		await get_tree().create_timer(GlobalManager.death_thirst_timeout).timeout
		get_tree().change_scene_to_file("res://scenes/died.tscn")

func getHydrated() -> void:
	curWater = maxWater
	pass

func _process(delta: float) -> void:
	if(curWater > 0): curWater = curWater-0.1
	pass
