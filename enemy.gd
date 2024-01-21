extends CharacterBody2D
class_name Enemy

@export var speed := 125
var target = null
var direction = Vector2.LEFT
var enemy_health := 50
var crit_chance : = 0.2

func _ready() -> void:
	add_to_group("enemy")

func _physics_process(delta: float) -> void:
	set_movement(delta)
	move_and_slide()

func set_movement(delta) -> void:
		if target:
			direction = (target.global_position - global_position).normalized()
		position += speed * direction * delta
		$Hand.rotation = direction.angle()

func take_damage(damage):
	%Hitflash.play("hit_flash")
	randomize()
	var is_critical = crit_chance > randf()
	if is_critical:
		damage *= 2
	DamageLabel.set_damage_label(damage, $DamageLabelPos.global_position, is_critical)
	set_health(damage)
	check_alive()

func set_health(damage) -> void:
	enemy_health -= damage

func check_alive() -> void:
	if enemy_health <= 0:
		target = null
		EnemyGlobal.enemies_left -= 1
		queue_free()

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body is Player:
		target = body

func _on_detection_area_body_exited(body: Node2D) -> void:
	if body is Player:
		target = null

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	target = null
	queue_free()
