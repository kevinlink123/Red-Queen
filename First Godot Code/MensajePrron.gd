extends Label
# entorno global (extend de xxx)
var cont = 0;
var num = 10;
var mensajeTimeOut = "Se acabo el timpo prro";

# _process se ejecuta por cada frame que se renderiza
func _process(delta):
	cont = cont + 1;
	if cont == 60:
		cont = 0;
		num = num - 1;
		text = str(num);
		

	if num == 0:
		cont = 0;
		text = mensajeTimeOut;