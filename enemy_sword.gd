extends Enemy

func _physics_process(delta: float) -> void:
	set_movement(delta)
	move_and_slide()
	if %AttackZone.is_colliding():
		%WeaponPlayer.play("sword_attack")
		await %WeaponPlayer.animation_finished

func _on_damage_area_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_damage(20)

