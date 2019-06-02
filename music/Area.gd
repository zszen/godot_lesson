#extends AudioStreamPlayer2D



# Called when the node enters the scene tree for the first time.
#func _ready():
#	($"../CollisionShape2D".shape as CircleShape2D).radius = max_distance
#	pass # Replace with function body.
#
##func _physics_process(delta):
##	var vrect = get_viewport_rect()
##	print(vrect)
#
#func _process(delta):
#	update()
#
#func _draw():
##	var rect = Rect2(position.x-max_distance/2,position.y-max_distance/2,max_distance,max_distance)
##	draw_rect(rect,Color(1,1,1,.2))
#	for i in range(10):
#		var ps = (i+1)/10.0
#		draw_circle(Vector2(), ps*max_distance, Color(1-ps,1-ps,1-ps,.1))