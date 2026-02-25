extends Control

@export var SFXintro: AudioStreamPlayer2D

func _on_btn_nuevo_juego_pressed() -> void:
	SFXintro.play()
	Fade.fade_and_change_scene("res://scenes/encuesta.tscn",1.0)

func _on_btn_cargar_pressed() -> void:
	pass # Replace with function body.

func _on_btn_opciones_pressed() -> void:
	pass # Replace with function body.

func _on_btn_salir_pressed() -> void:
	get_tree().quit()
