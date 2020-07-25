extends Path2D


onready var follow = $PathFollow2D

#onready var follow5 = $PathFollow2D5

signal score

#movement of the sprites
func _process(delta):
	follow.set_offset(follow.get_offset() + 400 * delta)
