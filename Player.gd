extends Area2D

signal hit_enemy

export var speed = 400 #pixel/sec
var screen_size
var target = Vector2()
var velocity = Vector2()
onready var animate = $AnimatedSprite
var isMotion = false;
var isGameOver = true;


func _ready():
	hide()
	screen_size = get_viewport_rect().size
#	debug()
	
func start(pos):
	isGameOver = false
	position = pos
	target = pos
	show()
	$CollisionShape2D.disabled = false
	
func _input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		target = event.position
#		print(target)

#func _input(event):
#	if event is InputEventScreenTouch and event.pressed:
#		target = event.position
#		print(target)

func _process(delta):
	if(isGameOver):
		return
	if position.distance_to(target)>10:
		velocity = (target-position).normalized()*speed
		isMotion = true;
	else:
		velocity = Vector2()
		isMotion = false;
#	var velocity = Vector2()
#	if Input.is_action_pressed("ui_right"):
#		velocity.x=1
#	if Input.is_action_pressed("ui_left"):
#		velocity.x=-1
##	else:
##		velocity.x=0
#	if Input.is_action_pressed("ui_up"):
#		velocity.y=-1
#	if Input.is_action_pressed("ui_down"):
#		velocity.y=1
#	else:
#		velocity.y=0
	
	if velocity.x!=0:
		$AnimatedSprite.animation = 'right'
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x<0
	elif velocity.y!=0:
		$AnimatedSprite.animation = 'up'
		$AnimatedSprite.flip_v = velocity.y>0	
	
	if velocity.length()>0:
#		velocity = velocity.normalized()*speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
#	$Particles2D.texture.get_data().flip_y()
#	print(vel)
	position+=velocity*delta
#	position.x = clamp(position.x, 0 ,screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)

func debug():
	var p1 = Vector2(1,1)
	var p2 = Vector2(7,13)
	var vec = (p2-p1).normalized()
	var n = Vector2(vec.y,-vec.x)
	var d = n.dot(p1)
	print(n.dot(p1))
	print(n.dot(p2))
		
		
func _on_Player_body_entered(body):
	hide()
	emit_signal('hit_enemy')
	$CollisionShape2D.set_deferred('disabled',true)
	isGameOver = true
#	pass # Replace with function body.


func _on_ghost_timer_timeout():
	if !isMotion || isGameOver:
		return
	var ghost := preload("res://Ghost.tscn").instance()
#	get_parent().add_child(ghost)
	get_parent().get_node("GhostLayer").add_child(ghost)
	ghost.position = global_position
	ghost.texture = animate.frames.get_frame(animate.animation,animate.frame)
	ghost.flip_h = animate.flip_h
	ghost.flip_v = animate.flip_v
	ghost.scale = animate.scale
#	$AnimatedSprite.frames.get_frame($AnimatedSprite.animation,$AnimatedSprite,frame)

#	pass # Replace with function body.
