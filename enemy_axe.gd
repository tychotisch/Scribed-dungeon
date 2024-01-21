extends Enemy

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body is Player:
		target = body
		%Timer.start()

func _on_timer_timeout() -> void:
	if %AttackZone.is_colliding():
		%WeaponPlayer.play("fire")
		%Weapon.fire_axe()


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body is Player:
		#target = null
		%Timer.stop()
