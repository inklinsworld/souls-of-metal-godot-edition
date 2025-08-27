extends Control

enum ContainerType {
	VBOX,
	HBOX,
	CENTER,
	GRID,
	PANEL
}

@export var control_node: Container
@export var rect: ReferenceRect

func _on_option_button_item_selected(index: int) -> void: 
	var new_container: Container
	
	match index:
		ContainerType.VBOX:
			new_container = VBoxContainer.new()
		ContainerType.HBOX:
			new_container = HBoxContainer.new()
		ContainerType.CENTER:
			new_container = CenterContainer.new()
		ContainerType.GRID:
			new_container = GridContainer.new()
		ContainerType.PANEL:
			new_container = PanelContainer.new()
	
	new_container.custom_minimum_size = rect.custom_minimum_size
	new_container.size = rect.size
	new_container.position = rect.position
	new_container.rotation = rect.rotation
	new_container.scale = rect.scale
	new_container.pivot_offset = rect.pivot_offset
	
	add_child(new_container)
	move_child(new_container, control_node.get_index())
	
	for child_thing in control_node.get_children():
		control_node.remove_child(child_thing)
		new_container.add_child(child_thing)
	
	control_node.queue_free()
	control_node = new_container
