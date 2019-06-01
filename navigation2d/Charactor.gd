extends Sprite

var speed :=400.0
var path := PoolVector2Array() setget set_path

func _ready():
	set_process(false)
	pass
	
func _process(delta:float):
	var move_distance : = speed*delta
	move_along_path(move_distance)
#	pass

func move_along_path(distance:float):
	var start_point:=position
	for i in range(path.size()):
		var distance_to_next:=start_point.distance_to(path[0])
		if distance <= distance_to_next and distance>.1:
			position = start_point.linear_interpolate(path[0], distance/ distance_to_next)
			break
		elif distance <0.0:
			position = path[0]
			set_process(false)
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
#		if path.size()==0:
#			set_process(false)
			
#	pass
	
func set_path(val: PoolVector2Array):
	if val.size()==0:
		return
	path = val
	set_process(true)
	
#	pass
