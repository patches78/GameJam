extends Node2D

@onready var player: CharacterBody2D = $"../../Player"
@onready var camera_player: Camera2D = $"../../CameraPlayer"


var frac
var watermeterBackGround 
var watermeterForeGround
var offset_x = 80
var offset_y = 40


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frac = player.curWater / player.maxWater
	watermeterBackGround = Rect2(0, 0, 102.0, 16.0)
	watermeterForeGround = Rect2(0 + 1, 0 + 1, 100.0 * frac, 16.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	frac = player.curWater / player.maxWater
	
	# Box allg
	watermeterBackGround = Rect2(player.position.x-offset_x, player.position.y-offset_y, 102.0, 16.0)
	# Wasserstand
	watermeterForeGround = Rect2(player.position.x-offset_x, player.position.y-offset_y, 100.0 * frac, 16.0)
	queue_redraw()
	pass

func _draw() -> void:
	draw_rect(watermeterBackGround, Color.BLACK)
	draw_rect(watermeterForeGround, Color.BLUE)
	pass
