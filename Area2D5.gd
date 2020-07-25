extends Area2D

var speed 
var pos_x
var pos_y

# Called when the node enters the scene tree for the first time.
func _ready():
	#must use randomize() if you want to generate random numbers
	#otherwise it will give you the same number (stupid, I know)
	randomize()
	speed = rand_range(275,375)
	#the direction of the squirrel
	rotation_degrees = rand_range(20,40)
	#position squirrel spawns
	pos_x = 0
	pos_y = rand_range(0,200)
	position = Vector2(pos_x, pos_y)
	

func _process(delta):
	position += transform.x * speed * delta
	print(speed)
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D5_area_entered(_area):
	queue_free()
