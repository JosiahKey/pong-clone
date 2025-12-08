extends Button

signal game_started

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start"):
		visible = false
		$"../p1victory".visible = false
		$"../p2victory".visible = false
		game_started.emit()
