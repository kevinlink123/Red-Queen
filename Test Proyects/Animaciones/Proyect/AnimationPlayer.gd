extends AnimationPlayer
var i = 0
var console = 0
func ready():
	print('1')

func _process(delta):
	if console == 0:
		if Input.is_action_just_pressed("ui_up"):
			i = i+1
			if i == 17: i = 0
			if i == 0: get_child(16).stop()
			else: get_child(i-1).stop()
			if i == 0: get_child(16).set_frame(0)
			else: get_child(i-1).set_frame(0)
			$Position2D.position = get_child(i).position
			get_child(i).play()
		if Input.is_action_just_pressed("ui_down"):
			i = i-1
			if i < 0 : i = 16
			if i == 16: get_child(0).stop()
			else: get_child(i+1).stop()
			if i == 16: get_child(0).set_frame(0)
			else: get_child(i+1).set_frame(0)
			$Position2D.position = get_child(i).position
			get_child(i).play()
	if console == 1:
		var index1
		for index1 in range (16):
			if $Position2D/Camera2D/Console.text == get_child(index1).name:
				var index2
				for index2 in range (16):
					if index1 != index2:
						get_child(index2).stop()
						get_child(index2).set_frame(0)
				$Position2D.position = get_child(index1).position
				get_child(index1).play()
				$Position2D/Camera2D/Console.text = ""
	if Input.is_action_just_pressed("~"):
		if $Position2D/Camera2D/Console.visible == false: 
			$Position2D/Camera2D/Console.show()
			console = 1
		else:
			$Position2D/Camera2D/Console.hide()
			for i in range (16):
					get_child(i).stop()
			console = 0
