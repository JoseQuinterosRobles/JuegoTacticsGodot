extends CanvasLayer
class_name TopBarUI

@export var dia_label: Label
@export var actions_label : Label
@export var mes_label : Label
@export var nombre_label : Label
@export var raza_jugador : Label


func _ready():
	nombre_label.text = "Jugador: " + Autoload.nombre_jugador
	actions_label.text = "Acciones: " + str(Autoload.acciones)
	raza_jugador.text = "Raza: " + Autoload.raza_jugador
	update_date()


const nombres_meses = [
	"Creador",
	"Cuerpo",
	"Mente",
	"Alma",
	"Presencia",
	"Humano",
	"Bestia",
	"Demonio",
	"Elfo",
	"Enano",
	"Elemental",
	"Animal",
	"Vacío"
]




func update_date():

	dia_label.text = "Día: %d " % [Calendario.dia_actual]
	mes_label.text = "Mes: %s " % [nombres_meses[Calendario.mes_actual -1]]

func set_actions(actions: int):
	actions_label.text = "Acciones: %d" % actions
	
func next_day():
	Calendario.dia_actual += 1

	if Calendario.dia_actual > 28:
		Calendario.dia_actual = 1
		Calendario.mes_actual += 1

		if Calendario.mes_actual > 13:
			Calendario.mes_actual = 1
	update_date()
