extends Node

@onready var viewport = $CanvasLayer/SubViewport

func _ready():
	%SettingsMenu.closed.connect(_on_pause_menu_closed)

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		%SettingsMenu.show()
	elif viewport and is_inside_tree():
		viewport.push_input(event)

func _unhandled_input(event):
	if viewport and is_inside_tree():
		viewport.push_unhandled_input(event)

func _on_pause_menu_closed():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
