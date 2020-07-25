extends Node2D
signal score



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_area_entered(_area):
	emit_signal("score")


func _on_Area2D2_area_entered(_area):
	emit_signal("score")
