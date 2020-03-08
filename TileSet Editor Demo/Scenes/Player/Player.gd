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
	var up_right = up && right;
	var up_left = up && left;
	var down_right = down && right;
	var down_left = down && left;
	var velocity = Vector2();
	
	if up:
		$AnimatedSprite.play("Back");
		velocity.y += -1;
		
	if down:
		$AnimatedSprite.play("Front");
		velocity.y += 1;
		
	if left:
		$AnimatedSprite.play("Left");
		velocity.x += -1;
		
	if right:
		$AnimatedSprite.play("Right");
		velocity.x += 1;
	
	if up_right || down_right:
		$AnimatedSprite.play("Right");
	
	if up_left || down_left:
		$AnimatedSprite.play("Left");
	
	
	if !(velocity.x) && !(velocity.y):
		print("idle");
		$AnimatedSprite.stop();
		$AnimatedSprite.set_frame(0);
	
	move_and_collide(velocity * speed);
