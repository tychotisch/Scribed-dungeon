extends Node2D


func _ready() -> void:
	%WaveLabel.text = "Wave: " + str(EnemyGlobal.wave)
	%EnemiesLeft.text = "Enemies leftd: " + str(EnemyGlobal.enemies_left)

func _process(_delta: float) -> void:
	%EnemiesLeft.text = "Enemies left: " + str(EnemyGlobal.enemies_left)
	if EnemyGlobal.enemies_left == 0:
		EnemyGlobal.start_next_wave()
		%WaveLabel.text = "Wave: " + str(EnemyGlobal.wave)
