extends Camera2D

@onready var player = $"../Player"
var pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	limit_left = -600
	limit_right = 1750
	limit_top = -900
	limit_bottom = 250


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pos = player.global_position
	#print("playerPos: ",camera_pos)
	# begrenzen
	pos.x = clamp(pos.x, limit_left, limit_right)
	pos.y = clamp(pos.y, limit_top, limit_bottom)

	#print("cameraPos: ",camera_pos)
	global_position = pos
