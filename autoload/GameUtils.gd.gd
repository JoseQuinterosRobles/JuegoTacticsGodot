# GameUtils.gd
extends Node


var dia_actual : int = 1
var puntos_accion : int = 5
var mes_actual : int = 1



func pasar_dia():
	dia_actual += 1
	puntos_accion = 10 # Se recargan los puntos al dormir
	print("Es el día ", dia_actual)

func next_day():
	dia_actual += 1

	if dia_actual > 28:
		dia_actual = 1
		mes_actual += 1

		if mes_actual > 13:
			mes_actual = 1



func tirar_y_sumar_altos(cantidad_dados: int, dados_a_sumar: int) -> int:
	if dados_a_sumar > cantidad_dados:
		dados_a_sumar = cantidad_dados
	
	var resultados = []
	for i in range(cantidad_dados):
		resultados.append(randi_range(1, 10))
	
	resultados.sort_custom(func(a, b): return a > b)
	
	var suma_total = 0
	for i in range(dados_a_sumar):
		suma_total += resultados[i]
		
	return suma_total
	
	
	
