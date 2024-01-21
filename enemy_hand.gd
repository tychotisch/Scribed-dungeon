extends Node2D

func _process(_delta: float) -> void:
	if $"..".target:
		hands_rotate_to_target()


func hands_rotate_to_target() -> void:
	rotation = global_position.angle_to_point($"..".target.global_position)
 
