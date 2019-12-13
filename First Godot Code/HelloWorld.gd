extends Panel

var originalText = "Cuando menos te lo esperas...";
var newText = "No hay fuerza de alma para continuar";


func _ready():
	get_node("Container/Button").connect("pressed", self, "on_button_pressed");
	get_node("Container/Label").text = originalText;

func on_button_pressed():
		get_node("Container/Label").text = newText;
	
	