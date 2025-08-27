@tool
extends Node
#signals
signal on_set_volume_db(float)
signal on_set_volume_linear(float)
#vars
enum AudioBus {}
@export var audio_bus: AudioBus
@export var volume_offset_db: float = 0
@export var volume_offset_linear: float = 0

func _ready() -> void:
	on_set_volume_db.emit(AudioServer.get_bus_volume_db(audio_bus))
	on_set_volume_linear.emit(AudioServer.get_bus_volume_linear(audio_bus))
#checks for audio buses and puts them as an enum option
func _validate_property(property: Dictionary):
	if property.name == "audio_bus":
		property.hint_string = ""
		for i in AudioServer.bus_count:
			if i > 0:
				property.hint_string += ","
			property.hint_string += AudioServer.get_bus_name(i)
#sets volume in decibels
func set_volume_db(value: float) -> void:
	AudioServer.set_bus_volume_db(audio_bus, value + volume_offset_db)
	on_set_volume_db.emit(value)
#sets volume linearly
func set_volume_linear(value: float) -> void:
	AudioServer.set_bus_volume_linear(audio_bus, value + volume_offset_linear)
	on_set_volume_linear.emit(value)
