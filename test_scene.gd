extends Node2D



func _on_reset_button_pressed() -> void:
	get_tree().reload_current_scene()
