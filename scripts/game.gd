extends Node2D

const TOTAL_COINS: int = 22

var coins_collected: int = 0

@onready var stats: Label = $"Player/Player/Stats"
@onready var timer: Timer = $"Win/Timer"
@onready var audio_stream_player: AudioStreamPlayer2D = $Player/Player/AudioStreamPlayer2D


func _ready() -> void:
	coins_collected = 0
	update_stats_label()

func collect_coin() -> void:
	coins_collected += 1
	if coins_collected == TOTAL_COINS:
		stats.text = "YOU WON!"
		timer.start()
		audio_stream_player.play()
	else:
		update_stats_label()

func update_stats_label() -> void:
	stats.text = str(coins_collected) + "/" + str(TOTAL_COINS)


func _on_timer_timeout() -> void:
	audio_stream_player.stop()
	get_tree().reload_current_scene()
