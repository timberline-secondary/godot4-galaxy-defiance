extends Control

const SAVE_PATH = "user://save.cfg"
const TEST_SAVE_PATH = "res://save.cfg"

var save_path = SAVE_PATH

@export var game_stats: GameStats
@onready var hi_score_value = %HiScoreValue
@onready var score_value = %ScoreValue


# Called when the node enters the scene tree for the first time.
func _ready():
	load_highscore()
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
		save_highscore()
	score_value.text = str(game_stats.score)
	hi_score_value.text = str(game_stats.highscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		game_stats.score = 0
		get_tree().change_scene_to_file("res://menus/menu.tscn")

func load_highscore():
	var config = ConfigFile.new()
	var error = config.load(save_path)
	
	if error != OK: 
		return
	game_stats.highscore = config.get_value("game", "highscore")
	
	
func save_highscore():
	var config = ConfigFile.new()
	config.set_value("game", "highscore", game_stats.highscore)
	
	config.save(save_path)
	
