extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D



func _on_body_entered(_body: Node2D) -> void:
	print("Splash!")
	audio_stream_player_2d.play()
