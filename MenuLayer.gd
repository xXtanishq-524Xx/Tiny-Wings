extends CanvasLayer

signal start_game

onready var gameplay_score_message = get_node("/root/World/HUD/Score")
onready var game_name = $StartMenu/GameName
onready var play_message = $StartMenu/PlayMessage
onready var score_label = $GameOverMenu/VBoxContainer/ScoreLabel
onready var highscore_label = $GameOverMenu/VBoxContainer/HighScoreLabel
onready var game_over_menu = $GameOverMenu
onready var tween = $Tween

var game_started = false

func _input(event):
	if event.is_action_pressed("flap") && !game_started:
		emit_signal("start_game")
		tween.interpolate_property(game_name, "modulate:a", 1, 0, 0.5)
		tween.interpolate_property(play_message, "modulate:a", 1, 0, 0.5)
		tween.interpolate_property(gameplay_score_message, "modulate:a", 0, 1, 0.5)
		
		tween.start()
		game_started = true
	if game_over_menu.visible == true:
		if event.is_action_pressed("flap"): 
			# warning-ignore:return_value_discarded
			get_tree().reload_current_scene()
			

func init_game_over_menu(score, highscore):
	score_label.text = "SCORE: " + str(score)
	highscore_label.text = "BEST: " + str(highscore)
	game_over_menu.visible = true

func _on_RestartButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
