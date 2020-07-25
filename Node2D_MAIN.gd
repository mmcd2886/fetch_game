extends Node2D

export (PackedScene) var squirrel_scene
export (PackedScene) var squirrel_scene_2
export (PackedScene) var random_squirrel_scene
export (PackedScene) var random_squirrel_scene_2

signal squirrel_killed


#play forest sounds when game loads
func _ready():
	$forest_ambience.play()
		

#startbutton pressed
func _on_HUD_start_game():
	$music.play()
	$ready_timer.start()
	#hide the ball when the start button is pressed
	#if ball is still on field when play again button is pressed
	$Area2D_ball/AnimatedSprite.hide()
	#restarts need to reshow dog
	$Area2D_dog/AnimatedSprite.show()
	#disable the collision for ball when 'Play Again' button is pushed
	#in case its still on the field from last game 
	$Area2D_ball/CollisionShape2D.set_deferred("disabled", true)
	$Area2D_ball/AnimatedSprite.hide()
		
#timer that is triggered after 'start' button is clicked
func _on_ready_timer_timeout():
	$squirrel_timer.start()
	$squirrel_2_timer.start()
	$random_squirrel_timer.start()
	$random_squirrel_timer_2.start()
	$show_message_timer.start()
	$hide_message_timer.start()
	$end_game_timer.start()
	$play_again_timer.start()
	#Hide the 'READY?' message
	$HUD/ready.hide()
	#show the man after the timer runs out
	$Area2D_man/AnimatedSprite.show()
	#throw ball animation after timer runs out
	$Area2D_man/AnimatedSprite.play("throw")
	#throwball sound after timer runs out                  or
	$Area2D_man/throw.play()
	#reset aniamtedSprite to 0 frame so that it will play form start
	$Area2D_man/AnimatedSprite.frame = 0
	#re-enable all hit boxes for when the player chooses to 'play again'
	#there is no need to re-anble hit boxes for the ball or the man because
	#ball will reenable after ball throw and ball will reenable after ball is picked up
	$Area2D_dog/CollisionShape2D.set_deferred("disabled", false)



#show 'Get the Squirrels!!!' message
func _on_show_message_timer_timeout():
	$HUD/squirrel.show()

#hide the 'Get the Squirrels!!!' message when timer runs out
func _on_hide_message_timer_timeout():
	$HUD/squirrel.hide()
	
func _on_squirrel_timer_timeout():
	#instance the squirrel scene and add it to the main scene
	var squirrel = squirrel_scene.instance()
	add_child(squirrel)
	#the 'squirrel.tscn' is instanced with the variable 'squirrel' after the timeout timer
	#reaches zero. I then create a coded signal (I can not trigger this code until
	#'squirrel' is instanced, which is why it follows 'add_child(squirrel)'. the 'squirrel 
	#instance will emit signal "score" when squirrel collides. The below code will then 
	#trigger 'func _squirrel():'
	squirrel.connect("score", self, "_squirrel")
	#play dog bark sound when squirrels enter scene
	$Area2D_dog/dog_bark.play()

func _on_random_squirrel_timer_timeout():
	var random_squirrel = random_squirrel_scene.instance()
	add_child(random_squirrel)
	random_squirrel.connect("score", self, "_squirrel")

	
func _squirrel():
	emit_signal("squirrel_killed")
	$squeak.play()
	
#'squirrel_2_timer' triggers the second set of squirrels 
func _on_squirrel_2_timer_timeout():
	var squirrel_2 = squirrel_scene_2.instance()
	add_child(squirrel_2)
	squirrel_2.connect("score", self, "_squirrel")
	#play dog bark sound when squirrels enter scene
	$Area2D_dog/dog_bark.play()

func _on_random_squirrel_timer_2_timeout():
	var random_squirrel_2 = random_squirrel_scene_2.instance()
	add_child(random_squirrel_2)
	random_squirrel_2.connect("score", self, "_squirrel")
	
func _on_end_game_timer_timeout():
	$Area2D_dog/CollisionShape2D.set_deferred("disabled", true)
	$Area2D_dog/AnimatedSprite.hide()
	$Area2D_man/CollisionShape2D.set_deferred("disabled", true)
	$Area2D_man/AnimatedSprite.hide()
	$Area2D_ball/CollisionShape2D.set_deferred("disabled", true)
	$Area2D_ball/AnimatedSprite.hide()
	#show the 'TIMES UP!' message
	$HUD/times_up.show()
	#this will stop the animation of the man throwing ball
	#which means the tennis ball wont thud if the game 
	#has already ended
	$Area2D_man/AnimatedSprite.stop()
	#stop the throwing when the end timer appears
	$Area2D_man/throw.stop()
	

	
	
#timer triggers the 'Play Again' Button
func _on_play_again_timer_timeout():
	#change start button to show text 'Play Again'
	$HUD/start.set_text("Play Again")
	#show start button after play_again timer runs out.
	$HUD/start.show()


#play snap sound when dog collides with ball
func _on_Area2D_ball_area_entered(_area):
	$snap.play()
