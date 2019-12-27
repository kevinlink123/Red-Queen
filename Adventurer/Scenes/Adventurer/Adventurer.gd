extends Node
var animPosition = 0;
var myAnimations = ["SwordSwipe","BackSlash"];
var arrowPosition = [225,760];

func _ready():
	randomize();


func _process(delta):
#print(Input.is_action_just_pressed("ui_up"))
	if(Input.is_action_just_pressed("ui_up")):
		playOnce(get_node(myAnimations[animPosition]));
	
	if(Input.is_action_just_pressed("ui_right")):
		if(animPosition == len(myAnimations) - 1):
			animPosition = 0;
		else:animPosition = animPosition + 1;
		print(animPosition);
		$Arrow.position.x = arrowPosition[animPosition];
	
	if(Input.is_action_just_pressed("ui_left")):
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