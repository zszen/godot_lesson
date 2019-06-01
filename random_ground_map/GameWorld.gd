extends Node2D
class_name GameWorld, "res://assets/icon.png"


signal started
signal finished

enum Cell{
	Obstacle,
	Ground,
	Outer,
}

export var inner_size:=Vector2(10,8)
export var perimeter_size:=Vector2(1,1)
export(float,0,1) var ground_probability :=0.1

# Public variables
onready var size := inner_size+2*perimeter_size

# Private variables
onready var _tile_map:TileMap = $TileMap
var _rng := RandomNumberGenerator.new()


func _ready()->void:
#	setup()
	size = inner_size+2*perimeter_size
#	print(size)
	_rng.randomize()
	setup()
	generate()
	pass


func setup() -> void:
#	"""
#	Sets the game window size to twice the resolution of the world.
#	"""
#	return
#	print('setup')
	var map_size_px = size*_tile_map.cell_size
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D,SceneTree.STRETCH_ASPECT_KEEP,map_size_px)
#	OS.set_window_size(2*map_size_px)
	OS.window_size = 2*map_size_px


func generate() -> void:
	emit_signal("started")
	generate_perimeter()
	generate_inner()
	emit_signal("finished")


func generate_perimeter() -> void:
	for x in [0,size.x-1]:
		for y in range(0,size.y):
			_tile_map.set_cell(x,y,_pick_random_texture(Cell.Outer))
	for x in range(1,size.x-1):
		for y in [0,size.y-1]:
			_tile_map.set_cell(x,y,_pick_random_texture(Cell.Outer))


func generate_inner() -> void:
	for x in range(1,size.x-1):
		for y in range(1,size.y-1):
			var cell:= get_random_tile(.5)
			_tile_map.set_cell(x,y,cell)
	pass

func get_random_tile(percent:float)->int:
	return _pick_random_texture(Cell.Ground) if _rng.randf()<percent else _pick_random_texture(Cell.Obstacle)

func _pick_random_texture(cell_type:int)->int:
	var interval := Vector2()
	if cell_type==Cell.Outer:
		interval = Vector2(0,9)
	elif cell_type==Cell.Ground:
		interval = Vector2(10,14)
	elif cell_type == Cell.Obstacle:
		interval = Vector2(15,27)
	return _rng.randi_range(interval.x,interval.y)
	

func _unhandled_input(event):
	if event.is_action_pressed("confirm"):
		generate()
#		generate_inner()