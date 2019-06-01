extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Player_hurt(hpLeft, hpTotal):
#	print($hp)
	$Control/hp.text = "%d / %d"%[hpLeft,hpTotal]
	$Control/ProgressBar.value = hpLeft*100/hpTotal
#	pass # Replace with function body.


func _on_Player_gameOver():
	$Control/BoardGameOver.visible = true
#	pass # Replace with function body.
