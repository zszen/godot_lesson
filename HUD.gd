extends CanvasLayer

signal start_game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
#	show_game_over()
	pass # Replace with function body.

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func update_score(score):
    $ScoreLabel.text = str(score)
	
func show_game_over():
    show_message("Game Over")
    yield($MessageTimer, "timeout")
    $MessageLabel.text = "Dodge the\nCreeps!"
    $MessageLabel.show()
    yield(get_tree().create_timer(1), 'timeout')
    $StartButton.show()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
	
#	pass # Replace with function body.


func _on_MessageTimer_timeout():
    $MessageLabel.hide()
#	pass # Replace with function body.
