extends Node2D

onready var nav:Navigation2D =$Navigation2D
onready var line:Line2D = $Line2D
onready var charactor:Sprite = $Charactor

#func _init():

func _unhandled_input(event):
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or event.pressed:
		return 
	var new_path:= nav.get_simple_path(charactor.global_position, event.global_position)
	line.points = new_path
	charactor.path = new_path
#	pass


