extends CanvasLayer
# https://www.youtube.com/watch?v=W6ZwKV9YoNg

@onready var game_manger = $".."

# init mit 0 / {max_coins}
func _ready() -> void:
	$Feedback_Coins.text = "Coins collected: 0 / " + str(game_manger.max_coins)
	

func _process(_delta):
	update_amount_coins(game_manger.score,game_manger.max_coins)

func update_amount_coins(coins,max_coins):
	$Feedback_Coins.text = "Coins collected: " + str(coins) + " / " + str(max_coins)
