tool
extends Sprite

#func _process(delta):
#	calculate_aspect_ratio()

func _on_water_diffuse_item_rect_changed():
	material.set_shader_param("aspect_ratio", scale.y/scale.x)
#
#func _on_water_diffuse_item_rect_changed():
#	pass # Replace with function body.
