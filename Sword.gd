extends Node2D



func _on_attack_area_body_entered(body: Node2D) -> void:
	if body is Player:
		%WeaponPlayer.play("sword_attack")
		await %WeaponPlayer.animation_finished

