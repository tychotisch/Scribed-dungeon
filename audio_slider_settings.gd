extends Control

@onready var audio_name_label: Label = $HBoxContainer/AudioNameLabel as Label
@onready var audio_number_label: Label = $HBoxContainer/AudioNumberLabel as Label
@onready var h_slider: HSlider = $HBoxContainer/HSlider as HSlider

@export_enum("Master", "Music", "Sfx") var bus_name : String

var bus_index : int = 0

func _ready() -> void:
	h_slider.value_changed.connect(on_value_changed)
	get_bus_index()
	set_name_label()
	set_slider_value()

func set_name_label() -> void:
	audio_name_label.text = str(bus_name) + " Volume"

func set_audio_volume_label() -> void:
	audio_number_label.text = str(h_slider.value * 100) + "%"

func get_bus_index() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)

func set_slider_value() -> void:
	h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	set_audio_volume_label()

func on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_audio_volume_label()
