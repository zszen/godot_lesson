extends Sprite

onready var amplitude = material.get_shader_param("amplitude")
#onready var timefactor = material.get_shader_param("time_factor")
#onready var amplitude = get("material/shader_param/amplitude")

func _ready():
#	print(timefactor)
	assert amplitude!=null

func _on_SliderControl_changed(val):
#	if amplitude==null:
#		return
	material.set_shader_param("time_factor",val)
#	pass # Replace with function body.


func _on_SliderControl2_changed(val):
	amplitude.x = val
	material.set_shader_param("amplitude",amplitude)
#	pass # Replace with function body.


func _on_SliderControl3_changed(val):
	amplitude.y = val
	material.set_shader_param("amplitude",amplitude)
#	pass # Replace with function body.
