extends Area3D

@onready var user = $"..";
func _ready():
	connect("body_entered", collide)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func collide(body: Node3D):
	user.collison(body);
