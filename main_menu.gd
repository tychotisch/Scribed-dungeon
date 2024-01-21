extends Control

@export var start_level = preload("res://main.tscn") as PackedScene

@onready var margin_container: MarginContainer = $MarginContainer
@onready var options_menu: OptionsMenu = $OptionsMenu as OptionsMenu


func _ready() -> void:
	connect_buttons()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

func _on_options_button_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true

func _on_reset_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_options_menu_back_button_pressed() -> void:
	margin_container.visible = true
	options_menu.visible = false

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func connect_buttons() -> void:
	options_menu.exit_options_menu.connect(_on_options_menu_back_button_pressed)
	%StartButton.connect("pressed", _on_start_button_pressed)
	%OptionsButton.connect("pressed", _on_options_button_pressed)
	%ResetButton.connect("pressed", _on_reset_button_pressed)
	%QuitButton.connect("pressed", _on_quit_button_pressed)
