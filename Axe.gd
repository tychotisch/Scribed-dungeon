extends Projectile

func _ready() -> void:
	$AnimationPlayer.play("attack")
