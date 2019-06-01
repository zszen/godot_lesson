extends Sprite
#class_name Ghost

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tween := $alpha

# Called when the node enters the scene tree for the first time.
func _ready():
#	print(tween)
	$alpha.interpolate_property(self,"modulate",Color(1,1,1,.5),Color(1,1,1,0),.6,Tween.TRANS_SINE,Tween.EASE_OUT)
#	$alpha.interpolate_property(self,"scale",Vector2(.5,.5),Vector2(.3,.3),.6,Tween.TRANS_SINE,Tween.EASE_OUT)
	$alpha.start()
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Alpha_tween_tween_completed(object, key):
	queue_free()
#	pass # Replace with function body.
