extends Area2D

var is_in_area = false
var city_level = 0
var factory_count = 0
@onready var line_2d: Line2D = $highlight_line
#export to be removed when implemented properly, as the label will be the same for many provinces
@export var label: Label

func _on_mouse_entered() -> void:
	is_in_area = true
	label.show()

func _on_mouse_exited() -> void:
	is_in_area = false
	line_2d.hide()
	label.hide()

func _process(delta):
	if is_in_area:
		label.text = "city level: " + str(city_level) + "
		factories: " + str(factory_count)

func _unhandled_input(event: InputEvent) -> void:
	if is_in_area and event is InputEventMouseButton and Input.is_action_pressed("select"):
		line_2d.show()

func _physics_process(delta):
	for city in range(0, city_level):
		factory_count += 2
