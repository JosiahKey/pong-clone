extends Button

signal game_started

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start"):
		game_started.emit()
