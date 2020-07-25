extends Path2D

onready var follow = $PathFollow2D
onready var follow2 = $PathFollow2D2
onready var follow3 = $PathFollow2D3
onready var follow4 = $PathFollow2D4
#onready var follow5 = $PathFollow2D5

var speed
var speed2
var speed3
var speed4


signal score

func _ready():
	randomize()
	#define the speed for each squireel.
	speed =  rand_range(175,190)
	speed2 = rand_range(210, 230)
	speed3 = rand_range(155,165)
	speed4 = rand_range(215,233)
	

#movement of the sprites
func _process(delta):
	follow.set_offset(follow.get_offset() + speed * delta)
	follow2.set_offset(follow2.get_offset() + speed2 * delta)
	follow3.set_offset(follow3.get_offset() + speed3 * delta)
	follow4.set_offset(follow4.get_offset() + speed4 * delta)



#Signal connects to 'Path2D'. Emits signal 'score' when squirrel 
#collides
func _on_Area2D_hit():
	emit_signal("score")
