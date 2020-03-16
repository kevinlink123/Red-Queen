extends Label
# entorno global (extend de xxx)
var cont = 0;
var num = 10;
var mensajeTimeOut = "Game Over";

# _process se ejecuta por cada frame que se renderiza
func _process(delta):
	text = str(num);
	cont = cont + 1;
	if cont == 60:
		cont = 0;
		num = num - 1;
		

	if num == 0:
		cont = 0;
		text = mensajeTimeOut;