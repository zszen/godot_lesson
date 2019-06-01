extends KinematicBody2D

onready var area:Area2D = $ActorDetector
onready var sprite:Sprite = $body
onready var timer:Timer = $Timer

export var damage:=5
export var move_speed:=250.0
export var attack_distance :=100.0
export var min_move_distance :=38.0

var player:Player

func _ready():
	set_physics_process(false)
#	pass # Replace with function body.

func _physics_process(delta):
	var direction := (player.global_position-global_position).normalized()
	var disctance_to_player := global_position.distance_to(player.global_position)
	sprite.flip_h = direction.x<0
	
	if disctance_to_player >= min_move_distance:
		move_and_collide(direction*move_speed*delta)
#	print(timer.is_stopped() , disctance_to_player , attack_distance)
	if timer.is_stopped() and disctance_to_player <= attack_distance:
		player.take_damage(damage)
		timer.start()

func _on_ActorDetector_body_entered(body):
	if not body is Player:
		return
	player = body
	set_physics_process(true)
#	pass # Replace with function body.


func _on_ActorDetector_body_exited(body):
	if not body is Player:
		return
	player = null
	set_physics_process(false)
	pass # Replace with function body.


func _on_Player_gameOver():
	set_physics_process(false)
#	pass # Replace with function body.
