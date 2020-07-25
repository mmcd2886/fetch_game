extends Area2D

var speed 
var pos_x
var pos_y

# Called when the node enters the scene tree for the first time.
func _ready():
	#must use randomize() if you want to generate random numbers
	#otherwise it will give you the same number (stupid, I know)
	randomize()
	speed = rand_range(240,325)
	#the direction of the squirrel
	rotation_degrees = rand_range(-15,-30)
	#position squirrel spawns
	pos_x = rand_range(300,500)
	pos_y = 600
	position = Vector2(pos_x, pos_y)
	

func _process(delta):
	position += transform.x * speed * delta
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D6_area_entered(_area):
	queue_free()
