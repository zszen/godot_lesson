extends RigidBody2D

export var min_speed = 150
export var max_speed = 250
var mob_types = ['walk','swim','fly']



func _ready():
#	pass # Replace with function body.
	$AnimatedSprite.animation = mob_types[randi()%mob_types.size()]
	$AnimatedSprite.play()
	




func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
#	pass # Replace with function body.
