class_name province
extends Area2D

var is_in_area = false
var tooltip = false
var city_level = 0
var factory_count = 0
@onready var line_2d: Line2D = $highlight_line
#export to be removed when implemented properly, as the label will be the same for many provinces
@export var label: Label

func _on_mouse_entered() -> void:
	is_in_area = true


func _on_mouse_exited() -> void:
	is_in_area = false
	tooltip = false

func _process(delta):
	if is_in_area:
		tooltip = true
		if Input.is_action_just_pressed("select"):
			line_2d.show()
	else:
		line_2d.hide()
	if tooltip:
		label.text = "city level: " + str(city_level) + "
		factories: " + str(factory_count)
		label.show()
	else:
		label.hide()
		label.text = ""

func _physics_process(delta):
	for city in range(0, city_level):
		factory_count += 2
