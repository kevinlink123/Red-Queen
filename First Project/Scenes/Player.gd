extends Area2D

signal hit

export var speed = 400;
var screen_size;
var velocity = Vector2();

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size;
	hide();
	
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		velocity.y += -4;
	if Input.is_action_pressed("ui_down"):
		velocity.y += 4;
	if Input.is_action_pressed("ui_right"):
		velocity.x += 4;
	if Input.is_action_pressed("ui_left"):
		velocity.x += -4;
	
	if Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_left"):
		velocity.x = 0;
	if Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_down"):
		velocity.y = 0;
	
	if velocity.length() > 0:
		#$AnimatedSprite.play();
		get_node("AnimatedSprite").play();
	else:
		$AnimatedSprite.stop();
	position += velocity * delta;
	position.x = clamp(position.x, 0, screen_size.x);
	position.y = clamp(position.y, 0, screen_size.y);
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "Right";
		$AnimatedSprite.flip_v = false;
		$AnimatedSprite.flip_h = velocity.x < 0;
	elif velocity.y != 0:
		$AnimatedSprite.animation = "Up";
		$AnimatedSprite.flip_v = velocity.y > 0;
		
	
	
func _on_Player_body_entered(body):
	emit_signal("hit");
	$CollisionShape2D.set_deferred("disabled", true);
	$AnimatedSprite.animation = "Death"

func start(pos):
	position = pos;
	show();
	$CollisionShape2D.disabled = false;