extends Path2D

onready var follow2 = $PathFollow2D2
onready var follow3 = $PathFollow2D3
onready var follow4 = $PathFollow2D4

signal score

var speed
var speed2
var speed3

func _ready():
	randomize()
	speed = rand_range(120, 200)
	speed2 = rand_range(140, 180)
	speed3 = rand_range(150, 200)

#movement of the sprites
func _process(delta):
	randomize()
	follow2.set_offset(follow2.get_offset() + speed * delta)
	follow3.set_offset(follow3.get_offset() + speed2 * delta)
	follow4.set_offset(follow4.get_offset() + speed3 * delta)


#Signal connects to 'Path2D'. Emits signal 'score' when squirrel 
#collides
func _on_Area2D_hit():
	emit_signal("score")



