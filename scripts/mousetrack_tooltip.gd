extends Label

#prototype implementation
func _process(delta):
	position.x = get_global_mouse_position().x + 15
	position.y = get_global_mouse_position().y
