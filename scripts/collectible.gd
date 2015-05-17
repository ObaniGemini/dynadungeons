extends Area2D

const types = [ "bomb_increase", "flame_increase", "speed_increase" ]
export var effect = types[0]
var global

func _on_body_enter(body):
	if (body extends global.player_script):
		if (effect == "bomb_increase" and body.max_bombs < global.MAX_BOMBS):
			body.max_bombs += 1
		elif (effect == "flame_increase" and body.bomb_range < global.MAX_FLAMERANGE):
			body.bomb_range += 1
		elif (effect == "speed_increase" and body.bomb_range < global.MAX_SPEED):
			body.speed += 1
		get_node("AnimationPlayer").play("pickup")

func _on_AnimationPlayer_finished():
	self.queue_free()

func _ready():
	global = get_node("/root/global")
	get_node("Sprite").set_texture(load("res://sprites/pickups/" + effect + ".png"))
