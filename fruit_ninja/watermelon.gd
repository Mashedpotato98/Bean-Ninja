extends Area2D

var spd = randi()%5+1
onready var anim = $AnimatedSprite
var timer = 1000000

func _ready():
	anim.play("Idle")

func _process(delta):
	position.x -= spd

	timer -= 1

	if timer == 0:
		position.x = rand_range(308,323)
		position.y = rand_range(75,382)
		anim.play("Idle")
		set_deferred("monitorable", true) 
		spd = randi()%5+1

func _on_VisibilityNotifier2D_screen_exited():
	spd = randi()%5+1
	position.x = rand_range(308,323)
	position.y = rand_range(75,382)
	Global.score -= 5

func _on_WaterMelon_area_entered(area):
	Global.score += 3
	anim.play("Cut")
	timer = 30
	set_deferred("monitorable", false) 
