extends Node
var animPosition = 0;
var myAnimations = ["SwordSwipe","BackSlash"];
var arrowPosition = [225,760];
var frames = 0;

func _ready():
	randomize();

func _process(delta):
	frames += 1;
	if(frames == 60):
		print($SwordSwipe.is_playing())
		frames = 0;
	HTTPClient.METHOD_GET;
	if(Input.is_action_just_pressed("ui_up")):
		$SwordShakeSound.pitch_scale = 0.3 + animPosition * 0.3
		$SwordShakeSound.play()
		playOnce(get_node(myAnimations[animPosition]));
	
	if(Input.is_action_just_pressed("ui_right")):
		$SwichSound.play()
		if(animPosition == len(myAnimations) - 1):
			animPosition = 0;
		else:animPosition = animPosition + 1;
		print(animPosition);
		$Arrow.position.x = arrowPosition[animPosition];
	
	if(Input.is_action_just_pressed("ui_left")):
		$SwichSound.play()
		if(animPosition <= 0):
			animPosition = len(myAnimations) - 1;
		else:animPosition = animPosition - 1;
		$Arrow.position.x = arrowPosition[animPosition];


func playOnce(animation):
	animation.play();
	print('qlo');
	animation.frame = 0;

func get_frames(animation, animationName):
	return animation.get_sprite_frames().get_frame_count(animationName);
