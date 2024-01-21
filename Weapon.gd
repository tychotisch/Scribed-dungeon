extends Node2D

func fire_weapon():
	%WeaponPlayer.play("fire_weapon")

func shoot() -> void:
	var projectile = preload("res://Projectiles/Arrow.tscn")
	var arrow = projectile.instantiate()
	get_tree().root.add_child(arrow)
	arrow.global_transform = %ProjectileSpawnPos.global_transform
