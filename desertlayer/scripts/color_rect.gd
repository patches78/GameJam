extends ColorRect

@onready var cam = $"../CameraPlayer"
@onready var player = $"../Player"

func _ready() -> void:
	helper()

func _process(_delta) -> void:
	helper()

func helper() -> void:
	# Größe setzen
	var vp = get_viewport().get_visible_rect().size
	size = vp / cam.zoom
	global_position = cam.get_screen_center_position() - size * 0.5
	#print(global_position)

	# anhand von Hydration Rot-Ton intesivieren (differentiell)
	var progress = (player.maxWater - player.curWater) / player.maxWater
	var transparency = progress * GlobalManager.transp_accleration
	transparency = min(1,transparency)
	color = Color(1,0,0,transparency)
	#print(color)
	pass
