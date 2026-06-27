extends Node2D

@onready var player: CharacterBody2D = $"../Player"
@onready var camera_player: Camera2D = $"../CameraPlayer"

var positionRec1x
var positionRec1y
var positionRec2x
var positionRec2y
var frac

var watermeterBackGround 
var watermeterForeGround

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	positionRec1x = camera_player.position.x-15
	positionRec1y = camera_player.position.y-45
	positionRec2x = camera_player.position.x-14
	positionRec2y = camera_player.position.y-44
	frac = player.curWater / player.maxWater
	watermeterBackGround = Rect2(positionRec1x, positionRec1y, 102.0, 16.0)
	watermeterForeGround = Rect2(positionRec2x, positionRec2y, 100.0 * frac, 16.0)
	print(player.curWater)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	positionRec1x = camera_player.position.x-15
	positionRec1y = camera_player.position.y-45
	positionRec2x = camera_player.position.x-14
	positionRec2y = camera_player.position.y-44
	frac = player.curWater / player.maxWater
	watermeterBackGround = Rect2(positionRec1x, positionRec1y, 102.0, 16.0)
	watermeterForeGround = Rect2(positionRec2x, positionRec2y, 100.0 * frac, 14.0)
	queue_redraw()
	pass

func _draw() -> void:
	draw_rect(watermeterBackGround, Color.BLACK)
	draw_rect(watermeterForeGround, Color.BLUE)
	pass
