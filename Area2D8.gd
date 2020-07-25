extends Area2D

var speed 
var pos_x
var pos_y

# Called when the node enters the scene tree for the first time.
func _ready():
	#must use randomize() if you want to generate random numbers
	#otherwise it will give you the same number (stupid, I know)
	randomize()
	speed = rand_range(100,300)
	#the direction of the squirrel
	rotation_degrees = rand_range(20,40)
	#position squirrel spawns
	pos_x = 0
	pos_y = rand_range(200,300)
	position = Vector2(pos_x, pos_y)
	

func _process(delta):
	position += transform.x * speed * delta
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D8_area_entered(area):
	emit_signal("score")
	queue_free()
