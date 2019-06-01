extends KinematicBody2D

signal hurt(hpLeft,hpTotal)
signal gameOver

class_name Player

#onready var tween : = $Tween
onready var timer := $Timer

var control_side = "p1"
const SPEED = 500
var isBlinking = false
const BlinkCountMax = 6
var blinkCount = BlinkCountMax
const HpTotal = 100
var hpLeft = HpTotal

func _process(delta):
	var nowSpeed = delta*SPEED
	position.x += (Input.get_action_strength(control_side+"_right")-Input.get_action_strength(control_side+"_left"))*nowSpeed
	position.y += (Input.get_action_strength(control_side+"_down")-Input.get_action_strength(control_side+"_up"))*nowSpeed
	if Input.get_action_strength(control_side+"_right"):
		$animate.flip_h = false
	elif Input.get_action_strength(control_side+"_left"):
		$animate.flip_h = true
		
func take_damage(val):
#	print('damage %d'%val)
#	tween.interpolate_property(self, "visible", false)
	hpLeft = max(hpLeft-val,0)
	timer.start()
	isBlinking = true;
	blinkCount = BlinkCountMax
	emit_signal("hurt", hpLeft, HpTotal)
	if hpLeft==0:
		emit_signal("gameOver")


func _on_Timer_timeout():
	if isBlinking:
		visible = !visible
		blinkCount-=1
		if blinkCount<=0:
			timer.stop()
#	pass # Replace with function body.
