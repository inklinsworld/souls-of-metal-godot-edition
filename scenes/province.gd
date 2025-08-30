class_name province
extends Area2D

var is_in_area = false


func _on_mouse_entered() -> void:
	is_in_area = true


func _on_mouse_exited() -> void:
	is_in_area = false

func _physics_process(delta):
	if is_in_area:
		pass #TODO: add test func
	else:
		pass
