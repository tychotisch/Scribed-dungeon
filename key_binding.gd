extends Control
class_name KeyBinding

@onready var label: Label = $HBoxContainer/Label
@onready var button: Button = $HBoxContainer/Button

@export var action_name := "up"

func _ready() -> void:
	set_process_unhandled_key_input(false)
	set_action_name() 
	set_button_text()

func set_action_name() -> void:
	label.text = "not assigned"

	match action_name:
		"up":
			label.text = "Move Up"
		"down":
			label.text = "Move Down"
		"left":
			label.text = "Move Left"
		"right":
			label.text = "Move Right"
		"shoot":
			label.text = "Fire Weapon"

func set_button_text() -> void:
	var action_events = InputMap.action_get_events(action_name)
	var action_event = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	button.text = "%s" % action_keycode


func _on_button_toggled(button_pressed) -> void:
	if button_pressed:
		button.text = "Press any key"
		set_process_unhandled_key_input(button_pressed)
		for i in get_tree().get_nodes_in_group("hotkey"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
	else:
		for i in get_tree().get_nodes_in_group("hotkey"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
		set_button_text()

func _unhandled_key_input(event: InputEvent) -> void:
	rebind_keys(event)
	button.button_pressed = false

func rebind_keys(event) -> void:
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
	set_process_unhandled_key_input(false)
	set_button_text()
	set_action_name()
