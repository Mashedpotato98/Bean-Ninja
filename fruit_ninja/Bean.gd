extends Area2D

var spd = randi()%3+1
onready var anim = $AnimatedSprite
var timer = 1000000

func _ready():
	anim.play("Idle")

func _process(delta):
	position.y += spd

	timer -= 1

	if timer == 0:
		spd = randi()%3+1
		position.x = rand_range(10,380)
		position.y = rand_range(-5,1)
		anim.play("Idle")
		set_deferred("monitorable", true) 

func _on_Bean_area_entered(area):
	spd = randi()%3+1
	Global.score += 1
	anim.play("Cut")
	timer = 30
	set_deferred("monitorable", false) 

func _on_VisibilityNotifier2D_screen_exited():
	position.x = rand_range(10,380)
	position.y = rand_range(-5,1)
	Global.score -= 5
