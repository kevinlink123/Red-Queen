extends KinematicBody2D
var MOTION_SPEED = 160
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

	motion = motion.normalized() * MOTION_SPEED
	move_and_slide(motion)
	Viewport
	