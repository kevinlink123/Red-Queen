extends KinematicBody2D


export var speed = 6;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2();
	if Input.is_action_pressed("ui_up"):
		velocity.y += -1;
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1;
	if Input.is_action_pressed("ui_left"):
		velocity.x += -1;
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1;
	
	
	$".".position.y += velocity.y * speed;
	$".".position.x += velocity.x * speed;
