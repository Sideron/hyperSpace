extends AnimationPlayer

@export var nameAnim: String;
# Called when the node enters the scene tree for the first time.
func _ready():
	play(nameAnim);
