extends Node2D

@onready var player: CharacterBody2D = $"../../Player"
@onready var camera_player: Camera2D = $"../../CameraPlayer"


var frac

var watermeterBackGround 
var watermeterForeGround

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frac = player.curWater / player.maxWater
	watermeterBackGround = Rect2(0, 0, 102.0, 16.0)
	watermeterForeGround = Rect2(0 + 1, 0 + 1, 100.0 * frac, 14.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	frac = player.curWater / player.maxWater
	
	watermeterBackGround = Rect2(clamp(camera_player.position.x, camera_player.limit_left+192, camera_player.limit_right-196)-195, clamp(camera_player.position.y, camera_player.limit_top, camera_player.limit_bottom-109)-100, 102.0, 16.0)
	watermeterForeGround = Rect2(clamp(camera_player.position.x, camera_player.limit_left+191, camera_player.limit_right-195) -194, clamp(camera_player.position.y, camera_player.limit_top, camera_player.limit_bottom-109)-99, 100.0 * frac, 14.0)
	queue_redraw()
	pass

func _draw() -> void:
	draw_rect(watermeterBackGround, Color.BLACK)
	draw_rect(watermeterForeGround, Color.BLUE)
	pass
