extends Node2D
class_name Projectile

@export var speed := 800
@export var damage_amount := 10

func _physics_process(delta: float) -> void:
	var direction = Vector2.UP.rotated(rotation)
	position += direction * speed * delta
	if %MapDetection.is_colliding():
		queue_free()

func _on_damage_area_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_damage(damage_amount)
		queue_free()
	if body is Enemy:
		body.take_damage(damage_amount)
		queue_free()

func _on_damage_area_area_entered(area: Area2D) -> void:
	if area is Shield:
		area.take_damage(damage_amount)
		queue_free()
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
