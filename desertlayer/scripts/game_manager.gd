extends Node

# https://forum.godotengine.org/t/i-cant-enable-loop-using-audiostreamplayer2d/1860/2

var score = 0
var max_coins = 0
var item_collected = 0

@onready var coin_count = $Coin_Count
@onready var wise_words = $Wise_Words
@onready var c_sound = $"../Music/Coin_Sound"
@onready var a_c_sound = $"../Music/All_Coins_Sound"
@onready var ability_sound = $"../Music/All_Coins_Sound" # todo: anpassen

# fürs Zählen aller coins
func register_coins():
	max_coins += 1
	GlobalGameManager.global_maxcoins = max_coins

func collect_coin():
	score += 1
	GlobalGameManager.global_coins = score
	c_sound.play()
	coin_count.text = "You collected " + str(score) + " of " + str(max_coins) + " coins!"

	if (score == max_coins):
		a_c_sound.play()

func awake_mushroom_master():
	wise_words.text = "Jump up to this box\nand fly like a rabbit."

func gain_ability():
	if item_collected == 0:
		item_collected = 1
		ability_sound.play()
	
