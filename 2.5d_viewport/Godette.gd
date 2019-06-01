extends KinematicBody

export var speed:=7.0
export var gravity:=30.0
export var jump_force:=12.0

var velocity_y:=0.0

func _unhandled_input(event):
	if Input.get_action_strength("p1_left"):
		$RotationOffset/animate.flip_h = true
	if Input.get_action_strength("p1_right"):
		$RotationOffset/animate.flip_h = false
	if Input.is_action_just_pressed("p1_jump"):
		velocity_y = jump_force
		

func _physics_process(delta):
	var direction_ground:=Vector2(
		Input.get_action_strength("p1_right")-Input.get_action_strength("p1_left"),
		Input.get_action_strength("p1_down")-Input.get_action_strength("p1_up")).normalized()
	if not is_on_floor():
		velocity_y-=gravity*delta
	var velocity=Vector3(
		direction_ground.x*speed,
		velocity_y,
		direction_ground.y*speed)
	move_and_slide(velocity, Vector3())
	
	if is_on_floor() or is_on_ceiling():
		velocity_y=0.0
	
	
	