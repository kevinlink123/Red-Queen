extends Position2D

func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if position == Vector2(-191,0):
		position = Vector2(0,0)
	else: if position == Vector2(0,0):
		position = Vector2(-191,0)
