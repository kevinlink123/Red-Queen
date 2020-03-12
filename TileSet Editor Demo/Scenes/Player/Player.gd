extends KinematicBody2D
<<<<<<< HEAD
var lastMovement: String;

export var speed = 6;

onready var lightConstants = $"/root/light_constants".lightConstants;

# Called when the node enters the scene tree for the first time.
=======

export var speed = 4;
var moveAble = true;

>>>>>>> dc105ffd374506c14db9569e2b5dfb862e9c5845
func _ready():
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass;


func _physics_process(delta):
<<<<<<< HEAD
	
	
	var up = Input.is_action_pressed("ui_up");
	var down = Input.is_action_pressed("ui_down");
	var left = Input.is_action_pressed("ui_left");
	var right = Input.is_action_pressed("ui_right");
	var velocity = Vector2();
	
	if up:
		if(left):
			$AnimatedSprite.play("Left");
		else: if(right):
			$AnimatedSprite.play("Right");
		else:
			$AnimatedSprite.play("Back");
		velocity.y += -1;
		$DiwiLight.set_rotation_degrees(lightConstants.rotationDegree.up)
		lastMovement = "Back";
		
	if down:
		if(left):
			$AnimatedSprite.play("Left");
		else: if(right):
			$AnimatedSprite.play("Right");
		else:
			$AnimatedSprite.play("Front");
		velocity.y += 1;
		$DiwiLight.set_rotation_degrees(lightConstants.rotationDegree.down)
		lastMovement = "Front";
		
	if left:
		$AnimatedSprite.play("Left");
		velocity.x += -1;
		$DiwiLight.set_rotation_degrees(lightConstants.rotationDegree.left)
		lastMovement = "Left";
		
	if right:
		$AnimatedSprite.play("Right");
		velocity.x += 1;
		$DiwiLight.set_rotation_degrees(lightConstants.rotationDegree.right)
		lastMovement = "Right";
	
	
	
	if !(velocity.x) && !(velocity.y):
		$AnimatedSprite.play("Still " + lastMovement);
		$AnimatedSprite.set_frame(0);
=======
	if moveAble:
		var up = Input.is_action_pressed("ui_up");
		var down = Input.is_action_pressed("ui_down");
		var left = Input.is_action_pressed("ui_left");
		var right = Input.is_action_pressed("ui_right");
		if Input.is_action_pressed("ui_shift"):
			speed = 6
		else:
			speed = 2
		
		var velocity = Vector2();
		
		if up:
			if (right || left) == false:
				$AnimatedSprite.play("Back");
			velocity.y += -1;
			
		if down:
			if (right || left) == false:
				$AnimatedSprite.play("Front");
			velocity.y += 1;
			
		if left:
			$AnimatedSprite.play("Left");
			velocity.x += -1;
			
		if right:
			$AnimatedSprite.play("Right");
			velocity.x += 1;
		
		if !(velocity.x) && !(velocity.y):
			print("idle");
			$AnimatedSprite.stop();
			$AnimatedSprite.set_frame(4);
		
		move_and_collide(velocity * speed);
	else:
		move_and_collide(Vector2(1,0))


func _on_ShallNotPass_body_entered(body):
	moveAble = false
	$AnimatedSprite.play("Right")
>>>>>>> dc105ffd374506c14db9569e2b5dfb862e9c5845
	

func _on_ShallPass_body_entered(body):
	moveAble = true
