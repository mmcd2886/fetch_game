extends Area2D

var speed 
var pos_x
var pos_y

# Called when the node enters the scene tree for the first time.
func _ready():
	#must use randomize() if you want to generate random numbers
	#otherwise it will give you the same number (stupid, I know)
	randomize()
	speed = rand_range(250, 325)
	#the direction of the squirrel
	rotation_degrees = rand_range(-50, -20)
	#position squirrel spawns
	pos_x = rand_range(400,600)
	pos_y = 600
	position = Vector2(pos_x, pos_y)
	

func _process(delta):
	position += transform.x * speed * delta

#Emits signal 'score' when squirrel collides
func _on_Area2D_hit():
	emit_signal("score")
	print("1")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D2_area_entered(_area):
	queue_free()
