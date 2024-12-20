extends Node3D

@export_category("Colors")
@export var speedColor: Color;
@export var shieldColor: Color;

@export_category("Settings")
@export var seconds:float = 10;
@export var speed_chance: int;
@export var shield_chance: int;

@export_category("Speed Settings")
@export var boostSpeed: float = 1.5;

@onready var portalSpr: Sprite3D = $portal;
@onready var player = $"../Player"
var collisioned = false;
var remaining: float;
var choosed: int = 0;
var warned = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	remaining = seconds;
	var chs = randi_range(1,100);
	if(chs < speed_chance):
		choosed = 1;
		portalSpr.modulate = speedColor;
	else:
		choosed = 2;
		portalSpr.modulate = shieldColor;

func _process(delta):
	position.z+= Global.speed * delta
	if(global_position.z>10 and !collisioned):
		queue_free();
	
	if collisioned:
		remaining -= delta;
		match choosed:
			1:
				pass
			2:
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
		match choosed:
			1:
				Global.mainSpeed *= boostSpeed;
			2:
				player.shield.change_properties(true);
				player.shieldOn = true
				print("Picked")

func returnState():
	match choosed:
		1:
			Global.mainSpeed /= boostSpeed;
		2:
			player.shieldOn = false;

func _destroy():
	pass#queue_free();
