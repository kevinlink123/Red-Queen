extends CanvasLayer
signal CancelAccion

func _on_KinematicBody2D_Responder():
	$Respuesta.show()
	$"Fancy Frame".show()
	$X.hide()

func _on_Jhonny_body_exited(body):
	$Respuesta.hide()
	$"Fancy Frame".hide()
	$X.hide()
	emit_signal("CancelAccion")

func _on_KinematicBody2D_Accion():
	$X.show()

func _on_The_Elder_One_body_exited(body):
	$X.hide()
	emit_signal("CancelAccion")

func _on_KinematicBody2D_ElderActivation():
	$AnimatedSprite.play()
