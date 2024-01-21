extends Node2D


func fire_axe() -> void:
	
	var axe_to_instance = preload("res://Projectiles/Axe.tscn")
	var axe = axe_to_instance.instantiate()
	get_tree().root.call_deferred("add_child", axe)
	axe.global_transform = %ProjectileSpawnPos.global_transform
