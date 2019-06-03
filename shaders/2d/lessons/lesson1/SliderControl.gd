tool
extends Control

signal changed(val)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String)var label="value"
export(int)var val_now=0
export(int)var val_max=100
export(int)var val_min=0
export(float)var val_step=0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	$HSlider.max_value = val_max;
	$HSlider.min_value = val_min;
	$HSlider.step = val_step;
	$HSlider.value = val_now;
	$Label.text = "%s: %.2f"%[label,$HSlider.value]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HSlider_value_changed(value):
	$Label.text = "%s: %.2f"%[label,$HSlider.value]
	emit_signal("changed",value)
#	pass # Replace with function body.
