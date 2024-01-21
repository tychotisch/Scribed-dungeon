extends Control
class_name OptionsMenu

@onready var back_button: Button = $MarginContainer/VBoxContainer/BackButton
@onready var settings_tab: SettingsTab = $MarginContainer/VBoxContainer/SettingsTab

signal exit_options_menu

func _ready() -> void:
	connect_signals()
	settings_tab.exit_options_menu.connect(on_back_button_pressed)
	set_process(false)

func connect_signals() -> void:
	back_button.connect("pressed", on_back_button_pressed)

func on_back_button_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)
