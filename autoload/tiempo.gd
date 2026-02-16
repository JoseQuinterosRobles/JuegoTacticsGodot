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
