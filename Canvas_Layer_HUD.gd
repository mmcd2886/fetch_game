extends CanvasLayer

signal start_game

#variable for score
var amount = int(0)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$ready.hide()
	$times_up.hide()
	$squirrel.hide()

func _on_start_pressed():
	#reset score to 0 at start of game
	amount = 0
	$score.text=str(amount)
	$ready.show()
	$start.hide()
	$title.hide()
	$times_up.hide()
	$arrow_keys.hide()
	emit_signal("start_game")


func _on_Area2D_man_area_entered(_score):
	amount += 1
	$score.text = str(amount)
	

#This signal is connected from 'Node2D'. It occurs when a squirrel collides.
func _on_Node2D_squirrel_killed():
	amount += 3
	$score.text = str(amount)

func _on_HUD_start_game():
	pass # Replace with function body.
