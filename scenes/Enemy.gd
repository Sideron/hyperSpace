extends Node3D

@export var hspeed: float = 40;
@onready var rayCenter: RayCast3D = $rayCenter;
@onready var rayCenter2: RayCast3D = $rayCenter2;
@onready var rayCenter3: RayCast3D = $rayCenter3;
@onready var rayLeft: RayCast3D = $rayLeft;
@onready var rayLeft2: RayCast3D = $rayLeft2;
@onready var rayRigth: RayCast3D = $rayRigth;
@onready var rayRigth2: RayCast3D = $rayRigth2;
var maxVeloc = 139
var minVeloc = 100
var rigthSpeed = 0;
var leftSpeed = 0;
var velocity = 0
var targetVeloc = 135
#temp variables
var hVelocity = 0;
var objectFront;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	objectFront = rayCenter.is_colliding() || rayCenter2.is_colliding() || rayCenter3.is_colliding();
	if(objectFront):
		if(checkLeft()<checkRigth()):
			moveX(-hspeed,delta);
			print("LEFT")
		else:
			moveX(hspeed,delta);
			print("RIGTH")
	else:
		hVelocity = Global._lerp_floats(hVelocity,0,delta)
		targetVeloc = maxVeloc;
		print("CENTER")
	
	position.x += hVelocity*delta;
	velocity = Global._lerp_floats(velocity,targetVeloc,1.1*delta);
	position.z+= (Global.speed-velocity) * delta
	#position.z = 20

func moveX(veloc:float, delta:float):
	hVelocity = Global._lerp_floats(hVelocity,veloc,delta);
	targetVeloc = maxVeloc*0.8
	
func _destroy():
	queue_free();
	
func collison(body: Node3D):
	if body.is_in_group("obstacle") || body.is_in_group("enemy") || body.is_in_group("player"):
		if(body.global_position.x>global_position.x):
			hVelocity = -hspeed*0.15;
		else:
			hVelocity = hspeed*0.15;
		targetVeloc *= 0.7
	if body.is_in_group("player"):
		print("Collided with player");

func checkRigth():
	if(!rayCenter3.is_colliding()):
		return 0
	elif(!rayRigth.is_colliding()):
		return 1
	elif(!rayRigth2.is_colliding()):
		return 2
	else:
		return 3

func checkLeft():
	if(!rayCenter2.is_colliding()):
		return 0
	elif(!rayLeft.is_colliding()):
		return 1
	elif(!rayLeft2.is_colliding()):
		return 2
	else:
		return 3
