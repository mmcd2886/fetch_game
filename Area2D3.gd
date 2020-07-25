extends Area2D

var speed 
var pos_x
var pos_y

# Called when the node enters the scene tree for the first time.
func _ready():
	#must use randomize() if you want to generate random numbers
	#otherwise it will give you the same number (stupid, I know)
	randomize()
	speed = rand_range(240, 310)
	print(speed)
	#the direction of the squirrel
	rotation_degrees = rand_range(-200, -225)
	#position squirrel spawns
	pos_x = 1000
	pos_y = 250
	position = Vector2(pos_x, pos_y)
	

func _process(delta):
	position += transform.x * speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Area2D2_area_entered(_area):
	queue_free()
