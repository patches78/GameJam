extends Camera2D

@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	limit_left = -600
	limit_right = 850
	limit_top = -750
	limit_bottom = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var camera_pos = player.global_position
	#print("playerPos: ",camera_pos)
	# begrenzen
	camera_pos.x = clamp(camera_pos.x, limit_left, limit_right)
	camera_pos.y = clamp(camera_pos.y, limit_top, limit_bottom)

	#print("cameraPos: ",camera_pos)
	global_position = camera_pos
