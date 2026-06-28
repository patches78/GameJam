extends Camera2D

@onready var player = $"../Player"

var pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	limit_left = -600
	limit_right = 850
	limit_top = -750
	limit_bottom = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pos = player.global_position
	#var tmp = (player.maxWater - player.curWater) * GlobalManager.zoom_acclereration
	#print(tmp)
	#print("playerPos: ",camera_pos)
	# begrenzen
	pos.x = clamp(pos.x, limit_left, limit_right)
	pos.y = clamp(pos.y, limit_top, limit_bottom)
	#print("cameraPos: ",camera_pos)
	global_position = pos
	# anhand von Hydration(Player) Zoom anpassen
	#zoom.x += tmp
	#zoom.y += tmp
	
