extends Node3D

@export var vspeed: float = 130;
@export var hspeed: float;
@export var interpolate: float = 0.01;
@export var lerpVSpeed: float = 1;
@export var bikeModel: Node3D;

@onready var disText: Label = $"../UIcanvas/Distance";
@onready var shield = $shield;
@onready var shadow: Sprite3D = $shadow;
@onready var camera: Camera3D = $Camera3D
var bikeRot: float = 0
var shieldOn = false;
var distance = 0;
var rigthSpeed = 0;
var leftSpeed = 0;

# Visual effects
var floatingCons = 0;
var startHeigth: float;
var shadowA: float;
const cameraExtremes:float = 1.6
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.mainSpeed = vspeed;
	startHeigth = bikeModel.position.y
	shadowA = shadow.modulate.a;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rigthSpeed = Global._lerp_floats(rigthSpeed, hspeed if Input.is_action_pressed("derecha") else 0,interpolate*delta)
	leftSpeed = Global._lerp_floats(leftSpeed, hspeed if Input.is_action_pressed("izquierda") else 0,interpolate*delta)
	var resultingSpeed = rigthSpeed - leftSpeed;
	position.x+= resultingSpeed*delta;
	
	if(Input.is_action_pressed("derecha") || Input.is_action_pressed("izquierda")):
		var derCons = Global.mainSpeed * (0.1 if Input.is_action_pressed("derecha") else 0);
		var izqCons = Global.mainSpeed * (0.1 if Input.is_action_pressed("izquierda") else 0);
		camera.pos = - (cameraExtremes * 1 if Input.is_action_pressed("izquierda") else 0) + (cameraExtremes * 1 if Input.is_action_pressed("derecha") else 0)
		bikeRot = (0.6 * 1 if Input.is_action_pressed("izquierda") else 0) - (0.6 * 1 if Input.is_action_pressed("derecha") else 0)
		vspeed = Global.mainSpeed - derCons - izqCons;
		bikeModel.rotation.z = lerp(bikeModel.rotation.z,bikeRot,delta)
	else:
		bikeRot = 0
		vspeed = Global.mainSpeed;
		bikeModel.rotation.z = lerp(bikeModel.rotation.z,bikeRot,2*delta)
		
	Global.speed = Global._lerp_floats(Global.speed,vspeed,lerpVSpeed *delta)
	
	distance += (Global.speed/60)*delta
	
	disText.text = str(distance).pad_decimals(0) + " m"
	
""" Notas de funcionamiento
La velocidad del jugador funciona en base a la variable Global.speed. Para tener una cuenta de la objetivo se usa la variable Global.mainSpeed, en esta se realizan los cambios por ejemplo si se quiere aumentar o frenar la velocidad por cierto tiempo.
"""
