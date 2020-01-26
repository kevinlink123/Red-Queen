extends KinematicBody2D

func _on_Area2D_body_entered(body):
	print('Q')
	move_and_slide(Vector2(500,0))

