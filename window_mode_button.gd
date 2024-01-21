extends Control


@onready var option_button: OptionButton = $HBoxContainer/OptionButton as OptionButton

const WINDOW_MODE : Array[String] = [
	"Full-screen",
	"Windowed",
	"Borderless Window"
]

func _ready() -> void:
	add_window_mode_items()
	option_button.item_selected.connect(on_window_mode_selected)
	
func add_window_mode_items() -> void:
	for mode in WINDOW_MODE:
		option_button.add_item(mode)

func on_window_mode_selected(index : int) -> void:
	match index:
		0: #Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Windowed
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #Borderless window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
