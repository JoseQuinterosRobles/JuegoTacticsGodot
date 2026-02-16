extends Node

@export var samir: Node2D
@export var img_castillo: Image
@export var img_camino: Image
@export var react: TextureRect
@export var fade: ColorRect 


const _dialogos = preload("res://dialogues/samir.dialogue")


func _ready():
	samir.cambiar_expresion("medioCuerpo")
	DialogueManager.show_dialogue_balloon(_dialogos,"entradaCastillo")
