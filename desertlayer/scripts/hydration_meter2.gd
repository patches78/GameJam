extends Node2D

@onready var player: CharacterBody2D = $"../../Player"

var frac = 0.0
var watermeterBackGround: Rect2
var watermeterForeGround: Rect2

const BG_SIZE = Vector2(102.0, 16.0)
const OFFSET = Vector2(0.0, 0.0) # oben links

func _process(_delta: float) -> void:
	frac = player.curWater / player.maxWater
	var clamped = clamp(frac, 0.0, 1.0)

	watermeterBackGround = Rect2(OFFSET.x, OFFSET.y, BG_SIZE.x, BG_SIZE.y)
	watermeterForeGround = Rect2(OFFSET.x + 1.0, OFFSET.y + 1.0, (BG_SIZE.x - 2.0) * clamped, BG_SIZE.y - 2.0)
	queue_redraw()
