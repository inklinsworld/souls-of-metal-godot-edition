extends Control

@onready var base_menu: VBoxContainer = $base_menu
@onready var settings: VBoxContainer = $settings
@onready var splash: Label = $splash
var splash_text = ["we were a shitshow!", "pol's mum is fat!", "made primarily by Sockmit!", "Provinces by Inklin", "the founder abandoned us so we picked up the scraps!", "bow down to supreme leader!", "Jayjay is a legend", "also try HOI4!"]

func _ready():
	base_menu.show()
	settings.hide()
	splash.text = splash_text.pick_random()

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


func _on_check_box_toggled(toggled_on: bool) -> void:
	Globals.debug_mode = toggled_on #thanks pol for the advice
