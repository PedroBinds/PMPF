extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down_left: RayCast2D = $RayCastDownLeft
@onready var ray_cast_down_right: RayCast2D = $RayCastDownRight

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Colliding with right wall
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	
	# Colliding with left wall
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	# No ground to the right
	if !ray_cast_down_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	
	# No ground to the left
	if !ray_cast_down_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta
