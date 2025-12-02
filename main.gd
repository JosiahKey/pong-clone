extends Node2D

@onready var p1scoreboard := $midfield/scoreboard/score1
@onready var p2scoreboard := $midfield/scoreboard/score2

var p1score : int = -1
var p2score : int = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	p1scoreboard.text = str(p1score)
	p2scoreboard.text = str(p2score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if p1score == 5 or p2score == 5:
		p1score = p1score + 1
		p2score = p2score + 1
		game_over()

func game_over():
	if p1score >5:
		$p1victory.visible = true
		get_tree().paused = true
		$gameover.playing = true
		await $gameover.finished
	else:
		$p2victory.visible = true
		get_tree().paused = true
		$gameover.playing = true
		await $gameover.finished

func _on_ball_spawn_timeout() -> void:
	$ball.spawn_ball()
	$PLayer1.position = Vector2(64,324)
	$PLayer2.position = Vector2(1088, 324)

func _on_p_2_goal_body_entered(_body: Node2D) -> void:
	$goal.playing = true
	p1score = p1score + 1
	p1scoreboard.text = str(p1score)
	$ball_spawn.start()

func _on_p_1_goal_body_entered(_body: Node2D) -> void:
	$goal.playing = true
	p2score = p2score + 1
	p2scoreboard.text = str(p2score)
	$ball_spawn.start()


func _on_start_game_started() -> void:
	pass # Replace with function body.
