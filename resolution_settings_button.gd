extends Control


@onready var option_button: OptionButton = $HBoxContainer/OptionButton as OptionButton

const RESOLUTION_DICT : Dictionary = {
	"1920 x 1080" : Vector2i(1920, 1080),
	"1280 x 720" : Vector2i(1280, 720 ),
	"1152, 648" : Vector2i(1152, 648)
}

func _ready() -> void:
	add_resolution_items()
	option_button.item_selected.connect(on_resolution_selected)
	
func add_resolution_items() -> void:
	for resolution_string in RESOLUTION_DICT:
		option_button.add_item(resolution_string)

func on_resolution_selected(index: int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICT.values()[index])
