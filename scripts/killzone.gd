extends Area2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	timer.start()
	print("Player died")
	audio_stream_player_2d.play()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1.0
