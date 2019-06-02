tool
extends Area2D

#signal 

export(int) var max_distance = 500
export(String, FILE, "*.ogg,*.wav") var audio_file_path:String

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	$AudioStreamPlayer2D.max_distance = max_distance
	$AudioStreamPlayer2D.stream = load(audio_file_path)
	($CollisionShape2D.shape as CircleShape2D).radius = max_distance
	set_process(false)
#	pass # Replace with function body.
	
	
#func _physics_process(delta):
#	var vrect = get_viewport_rect()
#	print(vrect)

func _process(delta):
	update()

func _draw():
#	var rect = Rect2(position.x-max_distance/2,position.y-max_distance/2,max_distance,max_distance)
#	draw_rect(rect,Color(1,1,1,.2))
	for i in range(10):
		var ps = (i+1)/10.0
		draw_circle(Vector2(), ps*max_distance, Color(1-ps,1-ps,1-ps,.1))

func _on_Area2D_body_entered(body):
	$AudioStreamPlayer2D.play()
	set_process(true)
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	$AudioStreamPlayer2D.stop()
	set_process(false)
	pass # Replace with function body.
