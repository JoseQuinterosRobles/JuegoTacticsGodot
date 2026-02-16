extends Control

const ENCUESTA = preload("res://dialogues/encuesta.dialogue")
@onready var line_edit = $inputNombre
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(ENCUESTA,"start")




# Esta función es la que llamamos desde el diálogo
func abrir_input_nombre():
	line_edit.visible = true
	line_edit.grab_focus()
	# No devolvemos nada, solo abrimos el cuadro

func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text != "":
		Autoload.nombre_jugador = new_text
		line_edit.visible = false



func _on_input_nombre_text_submitted(new_text: String) -> void:
	if new_text.strip_edges() != "": # .strip_edges() evita que guarden solo espacios en blanco
		# 1. Guardamos en el Autoload
		Autoload.nombre_jugador = new_text
		
		# 2. Escondemos el input
		line_edit.visible = false
		
		# 3. Hacemos que el diálogo continúe
		# Si usaste el método de etiquetas:
		DialogueManager.show_dialogue_balloon(ENCUESTA,"preguntas")
	else:
		print("¡El nombre no puede estar vacío!")



func subir_atributo_principal(atributo: String):
	match atributo:
		"cuerpo":
			Autoload.cuerpo +=1
		"mente":
			Autoload.mente +=1
		"expresion":
			Autoload.expresion +=1
		"alma":
			Autoload.alma +=1

func subir_habilidad(habilidad: String):
	match habilidad:
		"proezaFuerza":
			Autoload.proezaFuerza +=1
		"conocimientos":
			Autoload.conocimientos +=1
		"DestrezaManual":
			Autoload.DestrezaManual +=1
		"labia":
			Autoload.labia +=1
		"percepcion":
			Autoload.percepcion +=1
			
func asignar_raza(raza: String):
	Autoload.raza_jugador = raza

func inicio():
	Fade.fade_and_change_scene("res://scenes/casa_intro.tscn",1.0)
	#get_tree().change_scene_to_file("res://scenes/casa_intro.tscn")
