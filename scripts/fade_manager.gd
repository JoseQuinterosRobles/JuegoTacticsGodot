extends CanvasLayer
class_name FadeManager

@onready var rect := $ColorRect

func _ready():
	rect.color.a = 0.0
	visible = true

func fade_out(duration := 1.0):
	var tween = create_tween()
	tween.tween_property(rect, "color:a", 1.0, duration)
	return tween

func fade_in(duration := 1.0):
	var tween = create_tween()
	tween.tween_property(rect, "color:a", 0.0, duration)
	return tween

func fade_and_change_scene(path: String, duration := 1.0):
	var tween = fade_out(duration)
	tween.finished.connect(func():
		get_tree().change_scene_to_file(path)
		fade_in(duration)
	)

func reveal_from_black(node: CanvasItem, duration := 0.5):
	node.visible = true
	node.modulate = Color(0, 0, 0, 1)

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)

	tween.tween_property(node, "modulate", Color(1, 1, 1, 1), duration)
	await tween.finished


func set_img(react: TextureRect, img: String):

	var tween = fade_out(0.5)
	tween.finished.connect(func():
		react.texture = load(img)
		fade_in(0.5)
		)
