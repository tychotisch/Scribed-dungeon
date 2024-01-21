extends CharacterBody2D
class_name Player

var max_speed := 300
var drag_factor := 0.05
var screen_size
var crit_chance := 0.2
var player_health := 100
var player_alive := true

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	if player_alive:
		set_playable_area()
		set_movement(delta)
		
		if Input.is_action_pressed("shoot"):
			%Weapon.fire_weapon()
	move_and_slide()

func set_movement(delta):
	var direction := Input.get_vector("left", "right", "up", "down")
	var desired_velocity = max_speed * direction
	var steering_vector = desired_velocity - velocity
	velocity += steering_vector * drag_factor
	position += velocity * delta

func set_playable_area() -> void:
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func take_damage(damage):
	randomize()
	var is_critical = crit_chance > randf()
	if is_critical:
		damage *= 2
	%Hitflash.play("hit_flash")
	DamageLabel.set_damage_label(damage, $DamageLabelPos.global_position, is_critical)
	set_health(damage)

func set_health(damage) -> void:
	player_health -= damage
	player_health = clamp(player_health, 0, player_health)
	if player_health <= 0:
		set_death()

func set_death() -> void:
	%Hitflash.play("death")
	await %Hitflash.animation_finished
	player_alive = false
	Events.emit_signal("game_over")
	
