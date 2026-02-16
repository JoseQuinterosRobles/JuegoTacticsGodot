extends Control

const _dialogos = preload("res://dialogues/casa_intro.dialogue")
@export var topbar_scene: PackedScene
@export var _menu_salir: VBoxContainer
@export var _bloqueo: Control
@export var Samir: Node2D

func _ready():
	var ui = topbar_scene.instantiate()
	add_child(ui)
	

func _on_button_pressed() -> void:
	DialogueManager.show_dialogue_balloon(_dialogos,"puerta")


func _mostrar_menu():
	_bloqueo.visible = true
	_menu_salir.visible = true


func _on_btn_cancelar_pressed() -> void:
	_menu_salir.visible = false
	_bloqueo.visible = false


func _on_btn_cofre_pressed() -> void:
	DialogueManager.show_dialogue_balloon(_dialogos,"cofre")


func _on_btn_cama_pressed() -> void:
	DialogueManager.show_dialogue_balloon(_dialogos, "cama")


func siguienteDia():
	$UI_topbar.next_day()
	_bloqueo.visible = true
	Fade.fade_and_change_scene("res://scenes/casa_intro.tscn",1.0)
	

func _on_btn_castillo_pressed() -> void:
	Fade.fade_and_change_scene("res://scenes/castillo.tscn",1.0)
