#extends GConst

class_name GConst

#static var _instance = GConst.new()
#static func getInstance():
#	return _instance

var is_game_over setget setIsGameOver,getIsGameOver

#bool is_game_over = false

#is_game_over setget set_is_game_over,get_is_game_over

func setIsGameOver(val)->void:
	is_game_over = val;

func getIsGameOver()->bool:
	return is_game_over;
	

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
