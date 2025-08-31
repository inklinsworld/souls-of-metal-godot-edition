extends Node

@export var scenes: Array[Node]

# NOTICE: Naive implementation, needs another pass through as well as multiple improvements. This is not at it's final state.
#cleanup courtasy of Callmepol and Inklin

func load_mods(path):
	var dir = DirAccess.open(path)
	if !dir:
		print("An error occurred when trying to access the path.")
		DirAccess.make_dir_absolute(path)
		return
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			return
		if !file_name.ends_with(".pck"):
			return
		if !ProjectSettings.load_resource_pack(path + "/" + file_name):
			return
		print("Succesfully loaded " + file_name + ".")
		var desired_path: String = "res://mods/" + file_name.substr(0, file_name.find(".pck")) + "/Mod.tscn"
		if !ResourceLoader.exists(desired_path, "PackedScene"):
			return
		var scene = ResourceLoader.load(desired_path, "PackedScene", ResourceLoader.CacheMode.CACHE_MODE_REPLACE).instantiate()
		scenes.append(scene)
		if !scene.has_method("som_load"):
			return
		scene.call("som_load")
	file_name = dir.get_next()

func _ready() -> void:
	load_mods(OS.get_executable_path().get_base_dir() + "/Mods")
	for scene in scenes:
		if scene.has_method("som_init"):
			scene.call("som_init")
