extends Panel

var originalText = "Cuando menos te lo esperas...";
var newText = "Puto el que lo lea";
var wasPressed = false;

func _ready():
	get_node("Button").connect("pressed", self, "on_button_pressed");
	
	
func on_button_pressed():
	if wasPressed:
		get_node("Label").text = originalText;
		wasPressed = false;
	else:
		get_node("Label").text = newText;
		wasPressed = true;
	
	