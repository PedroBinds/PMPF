extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var game: Node2D = $"../.."

func _on_body_entered(_body: Node2D) -> void:
	print("+1 coin!")
	
	game.collect_coin()
	
	#This will duplicate the variable and stream the audio when the coin desapears
	var temp_audio_player = audio_stream_player_2d.duplicate()
	get_parent().add_child(temp_audio_player)
	temp_audio_player.position = position
	
	temp_audio_player.play()
	
	queue_free()
