extends Node


var wave := 1
var enemy_to_spawn := 5
var enemy_in_wave := wave * enemy_to_spawn
var enemy_spawned := 0
var enemies_left := 0

func _ready() -> void:
	Events.connect("reset", reset_level)
	enemies_left = enemy_in_wave

func reset_enemies() -> void:
	enemy_spawned = 0
	enemies_left = enemy_in_wave

func start_next_wave() -> void:
	wave += 1
	enemy_in_wave = wave * enemy_to_spawn
	reset_enemies()
	Events.emit_signal("start_next_wave")

func reset_level() -> void:
	wave = 0
	enemy_to_spawn = 5
	enemy_spawned = 0
	enemies_left = 0
