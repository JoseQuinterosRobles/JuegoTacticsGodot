extends Node2D


func try_move_unit(unit):
	var tilemap = $TileMap_Base
	var overlay = $TileMap_Overlay

	var mouse_pos = get_global_mouse_position()
	var target_cell = tilemap.local_to_map(mouse_pos)

	var distance = abs(target_cell.x - unit.original_position.x) + abs(target_cell.y - unit.original_position.y)

	if distance <= unit.move_range:
		unit.grid_position = target_cell
	else:
		unit.grid_position = unit.original_position

	unit.position = tilemap.map_to_local(unit.grid_position)

	overlay.clear()
	unit.is_selected = false


func show_movement_range(unit):
	var overlay = $TileMap_Overlay
	overlay.clear()

	for x in range(-unit.move_range, unit.move_range + 1):
		for y in range(-unit.move_range, unit.move_range + 1):
			var distance = abs(x) + abs(y)
			if distance <= unit.move_range:
				var cell = unit.grid_position + Vector2i(x, y)
				overlay.set_cell(0, cell, 0)
