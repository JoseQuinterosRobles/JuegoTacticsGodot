extends Node2D

@onready var suelo: TileMapLayer = $Suelo
@onready var personaje: Area2D = $Unidades/Caballero

var unidad_seleccionada = null
var rango_movimiento = 3 # Define cuántos cuadros se mueve el caballero

var astar = AStarGrid2D.new()
@onready var highlights: TileMapLayer = $Highlights # La capa para los cuadros azules

func _ready():
	# Primero configuramos la cuadrícula lógica
	setup_grid()
	# Luego ajustamos los personajes visualmente a esa cuadrícula
	snap_unidades_a_cuadricula()
	
func setup_grid():
	astar.region = suelo.get_used_rect() # Usa el tamaño de lo que pintaste
	astar.cell_size = Vector2(64, 64)    # El tamaño que me dijiste
	astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER # Movimiento tipo cruz (FE)
	astar.update()
	
	# Marcar los cuadros oscuros como "muros" (opcional por ahora)
	# Por ejemplo, si el tile en (X, Y) es el color oscuro, hacemos:
	# astar.set_point_solid(Vector2i(x, y), true)

func snap_unidades_a_cuadricula():
	for unidad in $Unidades.get_children():
		# Convertimos su posición de píxeles a coordenadas de mapa (0, 1, 2...)
		var celda = suelo.local_to_map(unidad.global_position)
		# La devolvemos al centro exacto de esa celda en píxeles
		unidad.global_position = suelo.map_to_local(celda)



func mostrar_rango_movimiento(pos_inicio: Vector2i, rango: int):
	highlights.clear()
	var rect_mapa = suelo.get_used_rect() # Para no salirnos del mapa
	
	for x in range(-rango, rango + 1):
		for y in range(-rango, rango + 1):
			var celda_objetivo = pos_inicio + Vector2i(x, y)
			var distancia = abs(x) + abs(y)
			
			# Verificamos que esté en rango Y dentro de los límites del mapa
			if distancia <= rango and rect_mapa.has_point(celda_objetivo):
				# IMPORTANTE: Aquí el '0' es el ID de tu TileSet y Vector2i(0,0) es la posición del color en tu imagen.
				highlights.set_cell(celda_objetivo, 0, Vector2i(0, 1)) # Prueba cambiando el (0,1) si sale el color equivocado

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var mouse_pos = get_global_mouse_position()
		var celda_clic = suelo.local_to_map(mouse_pos)
		
		# 1. SI NO HAY NADIE SELECCIONADO: Intentamos seleccionar al personaje
		if unidad_seleccionada == null:
			var celda_personaje = suelo.local_to_map(personaje.global_position)
			
			if celda_clic == celda_personaje:
				unidad_seleccionada = personaje
				mostrar_rango_movimiento(celda_personaje, rango_movimiento)
				print("Personaje seleccionado")
		
		# 2. SI YA HAY ALGUIEN SELECCIONADO: Intentamos moverlo
		else:
			# Solo movemos si la celda clicada tiene un "highlight" azul
			if highlights.get_cell_source_id(celda_clic) != -1:
				personaje.global_position = suelo.map_to_local(celda_clic)
				deseleccionar()
			else:
				# Si hacemos clic fuera del rango, deseleccionamos
				deseleccionar()

func deseleccionar():
	unidad_seleccionada = null
	highlights.clear()
	print("Deseleccionado")
