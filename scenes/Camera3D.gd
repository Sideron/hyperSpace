extends Camera3D

@export var player: Node3D;
@export var veloc:float = 80;
@export var ratio: float = 3;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if abs(position.x-player.position.x) >= 0.025:
		position.x += ((player.position.x-position.x)/ratio)*delta*veloc;
		#print("is Moving"+str(randf_range(0,1)))
