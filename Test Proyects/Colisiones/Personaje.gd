extends KinematicBody2D

signal Responder
signal Accion
signal ElderAction

var MOTION_SPEED = 3 # Pixels/second
var Jhonny = 0
var Elder = 0
onready var parent = get_parent()

func ready():
	$AnimatedSprite.animation = "Little Mary"

func _physics_process(_delta):
	var motion = Vector2()
	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
	if Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
	if Input.is_action_pressed("ui_page_down") && MOTION_SPEED > 0:
		MOTION_SPEED -= 0.5
	if Input.is_action_pressed("ui_page_up"):
		MOTION_SPEED += 0.5
	if Jhonny == 1 && Input.is_action_just_pressed("ui_x"):
		emit_signal("Responder")
		Jhonny = 0
	if Elder == 1 && Input.is_action_just_pressed("ui_x"):
		emit_signal("ElderAction")
		$AnimatedSprite.animation = "Little Mari Holding The Elder Wand"

	motion = motion.normalized() * MOTION_SPEED
	move_and_collide(motion)

func _on_Jhonny_body_entered(body):
	Jhonny = 1
	emit_signal("Accion")

func _on_The_Elder_One_body_entered(body):
	if Elder == 0:
		Elder = 1
		emit_signal("Accion")


func _on_HUD_CancelAccion():
	Jhonny = 0
	Elder = 0
