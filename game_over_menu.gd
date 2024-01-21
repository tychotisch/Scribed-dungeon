extends Control

func _ready() -> void:
	connect_signals()

func _on_reset_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	Events.emit_signal("reset")
	hide()


func _on_quit_button_pressed() -> void:
	get_tree().quit()

func show_game_over() -> void:
	show()
	get_tree().paused = true

func connect_signals() -> void:
	Events.connect("game_over", show_game_over)
	%ResetButton.connect("pressed", _on_reset_button_pressed)
	%QuitButton.connect("pressed", _on_quit_button_pressed)
