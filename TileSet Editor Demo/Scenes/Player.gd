extends KinematicBody2D


export var speed = 6;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass;


func _physics_process(delta):
	var up = Input.is_action_pressed("ui_up");
	var down = Input.is_action_pressed("ui_down");
	var left = Input.is_action_pressed("ui_left");
	var right = Input.is_action_pressed("ui_right");
	var velocity = Vector2();
	
	if up:
		velocity.y += -1;
	if down:
		velocity.y += 1;
	if left:
		velocity.x += -1;
	if right:
		velocity.x += 1;
	
	move_and_collide(velocity * speed);
