extends Camera2D

@export_category("Stuff")
@export var canMove: bool = true
@export var moveSpeed: float = 2.5

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if canMove and Input.is_action_pressed("camera_pan"):
			self.offset -= event.relative / zoom

func _process(delta: float) -> void:
	if canMove:
		if Input.is_action_pressed("camera_left"):
			self.offset.x -= moveSpeed * delta / zoom.x
		if Input.is_action_pressed("camera_right"):
			self.offset.x += moveSpeed * delta / zoom.x
		if Input.is_action_pressed("camera_up"):
			self.offset.y -= moveSpeed * delta / zoom.y
		if Input.is_action_pressed("camera_down"):
			self.offset.y += moveSpeed * delta / zoom.y
		if Input.is_action_just_pressed("camera_zoom_in"):
			self.zoom.x += self.zoom.x * 0.1
			self.zoom.y += self.zoom.y * 0.1
		if Input.is_action_just_pressed("camera_zoom_out"):
			self.zoom.x -= self.zoom.x * 0.1
			self.zoom.y -= self.zoom.y * 0.1
