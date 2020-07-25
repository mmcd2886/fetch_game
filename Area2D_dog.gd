extends Area2D

#member variables
#this was orginally 400
export var speed = 380
var screen_size

#the start animation will be dog with out ball
var hit_animation = 0

#called when node enters screne tree
func _ready():
	screen_size = get_viewport_rect().size
	
#change animation to dog withOUT ball in mouth when dog collides with man
func _on_Area2D_man_area_entered(_area):
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.frame = 0
	hit_animation = 0
	

#change animation to dog with ball in mouth when dog collides with ball
func _on_Area2D_ball_area_entered(_area):
	hit_animation = 1

#if the ball lands on the dog when it appears, 
#trigger ball in dogs mouth when the dog exits the ball
func _on_Area2D_ball_area_exited(_area):
	hit_animation = 1

#at end of game, change the animation to dog withOUT
#ball so when the game restarts the dog will start 
#without the ball	
func _on_end_game_timer_timeout():
	hit_animation = 0

#_process called every frame
#delta refers to frame length. Keeps movement consistent despite framerate
func _process(delta):
	var velocity = Vector2() #player's movement vector
	if Input.is_action_pressed("ui_right"):
		velocity.x+= 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1 
	if velocity.length() > 0:
		velocity=velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0 ,screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	
	if hit_animation == 0:
		if velocity.x != 0 or velocity.y != 0 and hit_animation == 0:
			$AnimatedSprite.animation = "walk"
			$AnimatedSprite.flip_v = false
			$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.x != 0 or velocity.y != 0:
		$AnimatedSprite.animation = "ball"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
		







