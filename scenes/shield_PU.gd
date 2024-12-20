extends StaticBody3D

var collisioned = false;
@export var seconds:float = 10;
var remaining: float;
var warned = false;
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
		player.shieldOn = true
		if(!warned):
			player.shield.change_properties(true);
		
	
	if(remaining <= 0.8 && !warned):
		player.shield.change_properties(false);
		warned = true
		print("warning")
		
	if remaining <= 0:
		returnState();
		queue_free();

func pickEffect():
	if(!collisioned):
		collisioned = true;
		player.shield.change_properties(true);
		player.shieldOn = true

func returnState():
	#player.shield.change_properties(false);
	player.shieldOn = false
	print("ended")
