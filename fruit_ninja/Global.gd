extends Node

var score = 0
var hp = 5

func _process(delta):
	if hp <= 0:
		get_tree().change_scene("res://Menu.tscn")
