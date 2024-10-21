extends CanvasLayer

var lives = 1

func _ready():
	#access any child node with $
	$life_number.text= String(lives)
	


func _on_life_collected():
	lives = lives+1
	_ready()


func _set_player_lives(live_num):
	lives= live_num
	_ready()
	
