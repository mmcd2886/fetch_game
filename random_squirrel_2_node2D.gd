extends Node2D

signal score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#emit signal when squirrel is hit
func _on_Area2D6_area_entered(_area):
	emit_signal("score")

#emit signal when squirrel is hit
func _on_Area2D5_area_entered(_area):
	emit_signal("score")


func _on_Area2D7_area_entered(_area):
	emit_signal("score")
