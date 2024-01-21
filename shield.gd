extends Area2D
class_name Shield

@export var shield_health := 30

func _on_area_entered(_area: Area2D) -> void:
	if Projectile:
		%AnimationPlayer.play("hit")

func take_damage(value) -> void:
	shield_health -= value
	
	if shield_health <= 0:
		queue_free()
