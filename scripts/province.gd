class_name province
extends Area2D

var is_in_area = false
var tooltip = false
@onready var line_2d: Line2D = $highlight_line


func _on_mouse_entered() -> void:
	is_in_area = true


func _on_mouse_exited() -> void:
	is_in_area = false

func _physics_process(delta):
	if is_in_area:
		if Input.is_action_just_pressed("select"):
			line_2d.show()
			tooltip = true
	else:
		line_2d.hide()
