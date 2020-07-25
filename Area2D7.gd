extends Area2D

var speed 
var pos_x
var pos_y

# Called when the node enters the scene tree for the first time.
func _ready():
	#must use randomize() if you want to generate random numbers
	#otherwise it will give you the same number (stupid, I know)
	randomize()
	speed = rand_range(300, 340)
	#the direction of the squirrel
	rotation_degrees = rand_range(-160,-170)
	#position squirrel spawns
	pos_x = rand_range(1200,1350)
	pos_y = rand_range(200,400)
	position = Vector2(pos_x, pos_y)
	

func _process(delta):
	position += transform.x * speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Area2D7_area_entered(_area):
	queue_free()

