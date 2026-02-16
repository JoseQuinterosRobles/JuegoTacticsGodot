extends Node2D

@export var cara: Sprite2D
# Cargamos las imágenes en un diccionario
var expresiones = {
	"neutral": preload("res://img/characters/samir/cara ojos cerrados.png"),
	"feliz": preload("res://img/characters/samir/caraFeliz.png"),
	"aburrida": preload("res://img/characters/samir/caraAburrida.png"),
	"sorprendida": preload("res://img/characters/samir/caraBocaAbierta.png"),
	"medioCuerpo": preload("res://img/characters/samir/mediocuerpo.png")
}

func cambiar_expresion(nombre_emocion: String):
	# Accedemos al nodo hijo mediante el símbolo $
	cara.texture = expresiones[nombre_emocion]


func visible():
	cara.visible = true
	
func invisible():
	cara.visible = false
