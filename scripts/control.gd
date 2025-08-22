extends Control

@onready var base_menu: VBoxContainer = $base_menu
@onready var settings: VBoxContainer = $settings

func _ready():
	base_menu.show()
	settings.hide()

func _on_button_3_pressed() -> void:
	get_tree().quit()

func _on_button_2_pressed() -> void:
	base_menu.hide()
	settings.show()

func _on_check_button_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)

func _on_button_pressed() -> void:
	base_menu.show()
	settings.hide()