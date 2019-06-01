extends KinematicBody2D #RigidBody2D

export(String, "p1","p2") var control_side
const SPEED = 500

func _ready():
	pass

func _process(delta):
#	print(control_side, control_side+"_right",Input.get_action_strength(control_side+"_right"))
	var nowSpeed = delta*SPEED
	position.x += (Input.get_action_strength(control_side+"_right")-Input.get_action_strength(control_side+"_left"))*nowSpeed
	position.y += (Input.get_action_strength(control_side+"_down")-Input.get_action_strength(control_side+"_up"))*nowSpeed
	if Input.get_action_strength(control_side+"_right"):
		$animate.flip_h = false
	elif Input.get_action_strength(control_side+"_left"):
		$animate.flip_h = true
		