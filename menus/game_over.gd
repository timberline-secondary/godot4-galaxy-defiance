extends Control

@export var game_stats: GameStats
@onready var hi_score_value = %HiScoreValue
@onready var score_value = %ScoreValue


# Called when the node enters the scene tree for the first time.
func _ready():
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
	score_value.text = str(game_stats.score)
	hi_score_value.text = str(game_stats.highscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		game_stats.score = 0
		get_tree().change_scene_to_file("res://menus/menu.tscn")
