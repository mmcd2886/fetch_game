extends Area2D

#signal for when throw animation is finished
signal ball_thrown

#Called when the node enters the scene tree for the first time.

func _ready():
	#hide man sprite until start button is pressed
	$AnimatedSprite.hide()
	#disable man collision for man at start of game
	#this will be re-enabled when dog gets ball
	$CollisionShape2D.set_deferred("disabled", true)

func _on_Area2D_ball_area_entered(_area):
	#enable collision for man after dog gets ball
	$CollisionShape2D.set_deferred("disabled", false)
	
func _on_Area2D_ball_area_exited(_area):
	#enable collision for man after dog exits ball
	$CollisionShape2D.set_deferred("disabled", false)
		
#emit signal after throw animation is done
#connect signal to to ball so ball disappears
#func _on_AnimationPlayer_animation_finished(_anim_name):
#	emit_signal("ball_thrown")
	
func _on_Area2D_man_area_entered(_area):
	$bell.play()
	#$clicker.play()
	#disable the collision for man as soon as ball is returned
	$CollisionShape2D.set_deferred("disabled", true)
	#trigger throw animation when dog collides with man
	$AnimatedSprite.play("throw")
	#trigger the throw sound
	$throw.play()
	#reset aniamtedSprite to 0 frame so that it will play form start
	$AnimatedSprite.frame = 0

func _on_AnimatedSprite_animation_finished():
	emit_signal("ball_thrown")



