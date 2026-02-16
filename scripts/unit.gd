extends Area2D
class_name Unit

@export var move_range: int = 4

var grid_position: Vector2i
var is_selected: bool = false
var dragging: bool = false
var original_position: Vector2i

func _ready():
	var tilemap = get_parent().get_node("TileMap_Base")
	grid_position = tilemap.local_to_map(position)
	position = tilemap.map_to_local(grid_position)





func _process(delta):
	if dragging:
		position = get_global_mouse_position()

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		print("CLICK EN UNIT")
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			is_selected = true
			dragging = true
			original_position = grid_position
			get_parent().show_movement_range(self)
		else:
			if dragging:
				dragging = false
				get_parent().try_move_unit(self)
