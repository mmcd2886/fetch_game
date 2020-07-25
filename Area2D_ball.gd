extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#hide ball at start
	$AnimatedSprite.hide()
	#disable the collision for ball so dog does not pick it
	#up before start button is clicked
	$CollisionShape2D.set_deferred("disabled", true)
	
#When dog collides with ball, hide the ball
func _on_Area2D_ball_area_entered(_area):
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite.hide()

#if the ball lands on the dog when it appears 
#the ball will hide when the dog exits the ball
func _on_Area2D_ball_area_exited(_area):
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite.hide()


func _on_Area2D_man_ball_thrown():
	#after throw animation, have ball appear at a random spot
	position.x = rand_range(650, 1000)
	position.y = rand_range(20, 570)
	$AnimatedSprite.show()
	#enable collision for ball after it is thrown
	$CollisionShape2D.set_deferred("disabled", false)
	#play thud sound
	$thud.play()

	


