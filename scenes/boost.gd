extends StaticBody3D

@export var boostSpeed: float = 500;
var collisioned = false;
@export var seconds:float = 10;
var remaining: float;
# Nodes used
@onready var player = $"../Player";

# Called when the node enters the scene tree for the first time.
func _ready():
	remaining = seconds;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.z+= Global.speed * delta
	if(global_position.z>10 and !collisioned):
		queue_free();
	
	if collisioned:
		remaining -= delta;
		#player.vspeed = boostSpeed;
	
	if remaining <= 0:
		returnState();
		queue_free();

func pickEffect():
	if(!collisioned):
		collisioned = true;
		player.vspeed *= boostSpeed;

func returnState():
	player.vspeed /= boostSpeed;
