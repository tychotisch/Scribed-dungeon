extends Node2D

@onready var enemy_1 := preload("res://Enemy/enemy_sword.tscn")
@onready var enemy_2 := preload("res://Enemy/enemy_axe.tscn")
@onready var enemy_3 := preload("res://Enemy/enemy_pike.tscn")
@onready var enemy_list := [enemy_1, enemy_2, enemy_3]
@onready var spawn_positions := []

func _ready() -> void:
	get_spawn_positions()
	Events.connect("start_next_wave", start_spawning)

func get_spawn_positions() -> void:
	for pos in get_children():
		if pos is Marker2D:
			spawn_positions.append(pos)

func spawn_enemy() -> void:
	if EnemyGlobal.enemy_spawned != EnemyGlobal.enemy_in_wave: 
		randomize()
		var pos_to_spawn = spawn_positions[randi() % spawn_positions.size()]
		var random_enemy = enemy_list[randi() % enemy_list.size()]
		var enemy = random_enemy.instantiate()
		#get_tree().root.add_child(enemy)
		add_child(enemy)
		enemy.global_position = pos_to_spawn.global_position
		if pos_to_spawn == %SpawnLeft:
			enemy.direction = Vector2.RIGHT
		if pos_to_spawn == %SpawnTop:
			enemy.direction = Vector2.DOWN
		if pos_to_spawn == %SpawnRight:
			enemy.direction = Vector2.LEFT
		EnemyGlobal.enemy_spawned += 1
	else:
		%Timer.stop()

func start_spawning() -> void:
	%Timer.start()

func _on_timer_timeout() -> void:
	spawn_enemy()
